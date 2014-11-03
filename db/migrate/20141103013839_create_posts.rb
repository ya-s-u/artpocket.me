class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :id_hash,  :null => false
      t.string  :title
      t.text    :body
      t.integer :category_id, :null => false, :index => true
      t.date  :open_date,  :null => false
      t.date  :close_date,  :null => false
      t.time  :open_time,  :null => false
      t.time  :close_time,  :null => false
      t.integer :charge,  :null => false
      t.string  :promoter,  :null => false
      t.string  :url
      t.string  :facebook
      t.string  :twitter
      t.string  :mail
      t.integer :manager_id,  :null => false, :index => true

      t.timestamps
    end
  end
end
