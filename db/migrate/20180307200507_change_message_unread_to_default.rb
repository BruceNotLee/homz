class ChangeMessageUnreadToDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :unread, :boolean, :default => true
  end
end
