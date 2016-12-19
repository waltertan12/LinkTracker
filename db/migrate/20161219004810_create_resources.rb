class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string  :title,            null: false, index: true
      t.integer :resource_type_id, null: false, index: true
      t.integer :rating,           null: false, index: true
      t.text    :notes
      t.integer :user_id,          null: false, index: true
      t.boolean :private,                       index: true, default: true

      t.timestamps
    end
  end
end
