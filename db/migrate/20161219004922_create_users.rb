class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email,           null: false
      t.string  :password_digest, null: false
      t.string  :session_token,   null: false, index: true, unique:  true
      t.boolean :admin,                                                   default: false
      
      t.timestamps
    end

    add_index :users, [:email, :password_digest], unique: true
  end
end
