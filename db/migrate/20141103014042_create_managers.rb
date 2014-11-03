class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string  :username,  :null => false
      t.string  :mail,  :null => false
      t.string  :password,  :null => false
      t.timestamps  :last_login_at, :null => false

      t.timestamps
    end
  end
end
