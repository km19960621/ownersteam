class RenameImageFrontColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :image_front, :image
  end
end
