class MoveCategoryNames < ActiveRecord::Migration
  def change
    Category.all.each do |category|
      CategoryName.new(name: category.name, category: category).save!
    end
  end
end
