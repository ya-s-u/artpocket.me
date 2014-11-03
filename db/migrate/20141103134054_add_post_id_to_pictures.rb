class AddPostIdToPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.column :post_id, :integer
      t.column :priority, :integer
    end
  end
end
