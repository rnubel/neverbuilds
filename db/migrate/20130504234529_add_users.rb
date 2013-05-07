class AddUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :character
      t.string :account
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end 
  end

  def down
    drop_table :users
  end
end
