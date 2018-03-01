class AddJsontoPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :raw_json, :text
  end
end
