class ChangeColumnnameImageToMeta < ActiveRecord::Migration
  def change
    rename_column(:pictures, :image_meta, :meta_meta)
  end
end
