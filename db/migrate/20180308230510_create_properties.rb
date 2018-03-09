class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.belongs_to :user, foreign_key: true
      t.string :bed
      t.string :bath
      t.string :zip
      t.string :neighborhood
      t.string :price
      t.string :sqft

      t.timestamps
    end
  end
end
