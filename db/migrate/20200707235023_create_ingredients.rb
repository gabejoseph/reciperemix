class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.integer :recipe_id
      t.integer :remix_id

      t.timestamps
    end
  end
end
