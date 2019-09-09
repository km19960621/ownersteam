class RemoveImageBackFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :image_back, :string
  end
end
