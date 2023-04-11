class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
