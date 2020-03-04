class AddUrlToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :url, :string, :default => ""
  end
end
