class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :avatar_url
      t.timestamps
=
    end
  end
end
