class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :order_id
      t.integer :card_id
      t.integer :position_id

      t.timestamps
    end
  end
end
