class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :messages, :receiver
    add_index :messages, :sender
    add_index :messages, :created_at
  end
end
