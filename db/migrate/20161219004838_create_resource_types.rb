class CreateResourceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_types do |t|
      t.string :resource_type, null: false, index: true

      t.timestamps
    end
  end
end
