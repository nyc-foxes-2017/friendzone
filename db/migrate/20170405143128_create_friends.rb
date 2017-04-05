class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :requester, null: false
      t.integer :requestee, null: false
      t.boolean :pending, default: true
      t.timestamps
    end
  end
end
