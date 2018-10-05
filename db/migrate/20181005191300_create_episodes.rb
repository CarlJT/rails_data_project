class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :thumbnail
      t.string :url
      t.string :site
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
