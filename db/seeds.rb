# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy items in existing tables
Medium.destroy_all
Tag.destroy_all

# Define URL, headers and query for AniList API
url = 'https://graphql.anilist.co'

headers = {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json'
}

query = "
    query($season: MediaSeason, $year: Int, $page: Int){
        Page(page: $page, perPage: 50){
            pageInfo{
                total
                hasNextPage
            }

            media(season: $season, seasonYear: $year, isAdult: false){
                id
                idMal
                title{
                    romaji
                    english
                    native
                }
                type
                format
                status
                description
                startDate{
                    year
                    month
                    day
                }
                endDate{
                    year
                    month
                    day
                }
                season
                episodes
                duration
                chapters
                volumes
                countryOfOrigin
                isLicensed
                source
                hashtag
                trailer{
                    id
                }
                updatedAt
                coverImage{
                    large
                    medium
                }
                bannerImage
                averageScore
                meanScore
                isAdult
                streamingEpisodes{
                    title
                    thumbnail
                    url
                    site
                }
                tags{
                    name
                    category
                }
            }
        }
    }
"

# Define where from Anilist.co to pull data from
seasons = ['WINTER', 'SPRING']
years = [2015]

# Loop through the years and seasons
years.each do |year|
    seasons.each do |season|
        has_next_page = true;
        page = 1;

        # Loop while there's still next page
        while has_next_page
            variables = {
                'season': season,
                'year': year,
                'page': page
            }

            body = {
                :query => query,
                :variables => variables
            }

            response = HTTParty.post(url, :headers => headers, :body => body.to_json)
            media_data = response.parsed_response["data"]["Page"]["media"]
            page_data = response.parsed_response["data"]["Page"]["pageInfo"]

            media_data.each do |i|
                m = Medium.create(id_anilist: i["id"], 
                    id_mal: i["idMal"], 
                    media_type: i["type"], 
                    format: i["format"],
                    status: i["status"],
                    description: i["description"],
                    start_date: "#{i["startDate"]["year"]}-#{i["startDate"]["month"]}-#{i["startDate"]["day"]}",
                    end_date: "#{i["endDate"]["year"]}-#{i["endDate"]["month"]}-#{i["endDate"]["day"]}",
                    season: i["season"],
                    episode_count: i["episodes"],
                    duration: i["duration"],
                    chapters: i["chapters"],
                    volumes: i["volumes"],
                    country_of_origin: i["countryofOrigin"],
                    is_licensed: i["isLicensed"],
                    source: i["source"],
                    hashtag: i["hashtag"],
                    updated_at_anilist: i["updatedAt"],
                    average_score: i["averageScore"],
                    mean_score: i["meanScore"],
                    is_adult: i["isAdult"])

                m.media_titles.create(code: "romaji", title: i["title"]["native"])
                m.media_titles.create(code: "romaji", title: i["title"]["romaji"])
                m.media_titles.create(code: "english", title: i["title"]["english"])

                # Create record for each available picture
                m.media_pictures.create(size: "large", description: "cover_image", link: i["coverImage"]["large"])
                m.media_pictures.create(size: "medium", description: "cover_image", link: i["coverImage"]["medium"])
                m.media_pictures.create(description: "banner_image", link: i["bannerImage"])

                # Pull episodes
                unless i['streamingEpisodes'].length < 1
                    episodes  = i['streamingEpisodes']

                    episodes.each do |e|
                        m.episodes.create(title: e['title'], thumbnail: e['thumbnail'], url: e['url'], site: e['site'])
                    end
                end

                # Pull tags, create if it doesn't exist yet in the database
                unless i['tags'].length < 1
                    tags = i['tags']

                    tags.each do |t|
                        tag_from_db_count = Tag.where(:name => t['name']).count

                        # If tag is nil, create one in the database
                        if tag_from_db_count == 0
                            tag_from_db  = Tag.create(name: t['name'], category: t['category'])
                            MediaTag.create(medium: m, tag: tag_from_db)
                        else
                            tag = Tag.where(:name => t['name']).first
                            MediaTag.create(medium: m, tag: tag)
                        end
                        # Create relation between media and tag
                        
                    end
                end
            end

            has_next_page = page_data["hasNextPage"]

            if has_next_page
                page += 1
            end
        end
    end
end