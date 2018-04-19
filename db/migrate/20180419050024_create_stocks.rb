class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.float :entry
      t.float :stop_loss

      t.timestamps
    end
  end
end
