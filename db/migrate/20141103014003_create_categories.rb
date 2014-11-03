class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :title, :null => false
      t.string  :title_ja,  :null => false

      t.timestamps
    end
  end
end
