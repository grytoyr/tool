class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.string :category
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
