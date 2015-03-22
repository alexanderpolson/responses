class CreateCategoryNames < ActiveRecord::Migration
  def change
    create_table :category_names do |t|
      t.string :name
      t.belongs_to :category, index: true
      t.timestamps null: false
    end
  end
end
