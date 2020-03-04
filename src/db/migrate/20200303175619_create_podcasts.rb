class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string "title", default: "", null: false
      t.datetime "created_at", null: false, default: ""
      t.datetime "updated_at", null: false, default: ""
      t.integer "user_id", null: false, default: ""
    end
  end
end
