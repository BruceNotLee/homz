class AddCaptionToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :caption, :string
  end
end
