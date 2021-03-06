class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id,     null: false
      t.integer :resource_id, null: false

      t.timestamps
    end

    add_index :favorites, [:user_id, :resource_id], unique: true
  end
end
