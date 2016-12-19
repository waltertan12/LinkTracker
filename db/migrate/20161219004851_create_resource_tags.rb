class CreateResourceTags < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_tags do |t|
      t.integer :resource_id, null: false
      t.integer :tag_id,      null: false

      t.timestamps
    end

    add_index :resource_tags, [:resource_id, :tag_id], unique: true
  end
end
