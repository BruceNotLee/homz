class AddPropertyToPictures < ActiveRecord::Migration[5.1]
  def change
    add_reference :pictures, :property, foreign_key: true
  end
end
