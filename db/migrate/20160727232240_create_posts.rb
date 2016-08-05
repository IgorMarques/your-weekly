class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :description
      t.date :sent_on, index: true

      t.timestamps
    end
  end
end
