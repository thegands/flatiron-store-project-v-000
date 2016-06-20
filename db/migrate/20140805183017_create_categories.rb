class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      # t.integer :inventory
      # t.decimal :price

      t.timestamps
    end
  end
end
