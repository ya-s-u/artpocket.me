class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string  :title,  :null => false
      t.string  :title_ja, :null => false
      t.text    :body
      t.string  :url
      t.string  :facebook
      t.string  :twitter
      t.string  :mail
      t.integer :phone
      t.decimal :latitude, :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6

      t.timestamps
    end
  end
end
