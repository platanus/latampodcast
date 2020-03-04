class AddPodcastImageSlug < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :image_slug, :string, :default => ""
  end
end
