class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.integer :id_anilist
      t.integer :id_mal
      t.string :media_type
      t.string :format
      t.string :status
      t.text :description
      t.string :start_date
      t.string :end_date
      t.string :season
      t.integer :episodes
      t.integer :duration
      t.integer :chapters
      t.integer :volumes
      t.string :country_of_origin
      t.boolean :is_licensed
      t.string :source
      t.string :hashtag
      t.integer :updated_at_anilist
      t.integer :average_score
      t.integer :mean_score
      t.boolean :is_adult

      t.timestamps
    end
  end
end
