class RenameMediumAttribute < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :episodes, :episode_count
  end
end
