class CreateRemixes < ActiveRecord::Migration[6.0]
  def change
    create_table :remixes do |t|
      t.string :name
      t.string :ingredients
      t.integer :user_id

      t.timestamps
    end
  end
end
