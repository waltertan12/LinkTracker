class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string  :link_source, null: false, index: true
      t.integer :resource_id, null: false, index: true

      t.timestamps
    end

    add_index :links, [:link_source, :resource_id], unique: true
  end
end
