class CreateMediaTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :media_titles do |t|
      t.string :code
      t.string :title
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
