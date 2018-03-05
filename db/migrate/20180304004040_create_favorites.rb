class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :picture, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
