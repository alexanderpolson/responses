class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :responses, :categories
  end
end
