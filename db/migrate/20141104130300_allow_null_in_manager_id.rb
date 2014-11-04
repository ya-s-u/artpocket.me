class AllowNullInManagerId < ActiveRecord::Migration
  def change
    change_column :posts, :manager_id, :integer, :null => true
  end
end
