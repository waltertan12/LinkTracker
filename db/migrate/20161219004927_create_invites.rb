class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string    :invite_digest,   null: false, index: true, unique:  true
      t.boolean   :valid,                        index: true,               default: false
      t.datetime  :expiration_date, null: false, index: true

      t.timestamps
    end
  end
end
