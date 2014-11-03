class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :udid,  :null => false
      t.string  :sex, :null => false
      t.integer :birthday,  :null => false

      t.timestamps
    end
  end
end
