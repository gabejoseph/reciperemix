class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.integer :fats
      t.integer :carbohydrates
      t.integer :protein
      t.integer :recipe_id

      t.timestamps
    end
  end
end
