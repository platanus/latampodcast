class UserPodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_podcasts do |t|
      t.integer :podcast_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.timestamps
    end

    add_foreign_key :user_podcasts, :users, column: :user_id
    add_foreign_key :user_podcasts, :podcasts, column: :podcast_id
  end
end
