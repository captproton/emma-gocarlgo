class AddContactMessageReceiverToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :contact_message_receiver, :boolean, default: false
  end
end
