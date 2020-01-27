class CreateGroupcards < ActiveRecord::Migration[5.2]
  def change
    create_table :groupcards do |t|
      t.string :title, null: false, limit: 255
      t.text :memo, limit: 1000
      t.integer :status, default: 0
      t.references :grouplist, null: false

      t.timestamps
    end
  end
end
