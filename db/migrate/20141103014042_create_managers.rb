class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|

      t.timestamps
    end
  end
end
