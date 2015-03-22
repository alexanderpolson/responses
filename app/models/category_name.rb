class CategoryName < ActiveRecord::Base
  MISSING = '404'.freeze

  belongs_to :category

  def self.missing
    CategoryName.where(name: MISSING).take
  end
end
