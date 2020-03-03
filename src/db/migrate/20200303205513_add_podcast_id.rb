class AddPodcastId < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :podcast_id, :integer, :default => ""
  end
end
