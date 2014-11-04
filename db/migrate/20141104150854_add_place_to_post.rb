class AddPlaceToPost < ActiveRecord::Migration
  def change
  add_column :posts, :place, :string, :null => false, :default => '', :after => :close_time
  end
end
