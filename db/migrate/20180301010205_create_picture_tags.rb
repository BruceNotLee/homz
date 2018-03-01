class CreatePictureTags < ActiveRecord::Migration[5.1]
  def change
    create_table :picture_tags do |t|
      t.string :tag_name
      t.string :rating
      t.references :picture, foreign_key: true

      t.timestamps
    end
  end
end
