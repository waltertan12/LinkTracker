class CreateResourceLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_links do |t|
      t.integer :resource_id, null: false
      t.integer :link_id,     null: false

      t.timestamps
    end

    add_index :resource_links, [:resource_id, :link_id], unique: true
  end
end
