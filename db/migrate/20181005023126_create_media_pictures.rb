class CreateMediaPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :media_pictures do |t|
      t.string :size
      t.string :description
      t.string :link
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
