class AddReadDeleteToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :is_read, :boolean, null: false, default: false
    add_column :messages, :is_deleted, :boolean, null: false, default: false
  end
end
