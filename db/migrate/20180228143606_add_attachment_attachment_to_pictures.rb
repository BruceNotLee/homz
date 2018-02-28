class AddAttachmentAttachmentToPictures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pictures do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :pictures, :attachment
  end
end
