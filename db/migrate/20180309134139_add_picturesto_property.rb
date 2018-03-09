class AddPicturestoProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :pic_array, :string
  end
end
