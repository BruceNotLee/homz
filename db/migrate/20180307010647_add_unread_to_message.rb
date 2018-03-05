class AddUnreadToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :unread, :boolean
  end
end
