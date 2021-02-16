class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :sender
      t.text :receiver
      t.text :content

      t.timestamps
    end
  end
end
