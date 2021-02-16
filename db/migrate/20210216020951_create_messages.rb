class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :sender, null: false
      t.text :receiver, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
