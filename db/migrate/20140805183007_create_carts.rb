class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user
      t.string :status

      t.timestamps
    end
  end
end
