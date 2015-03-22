class Category < ActiveRecord::Base
  has_many :responses
  has_many :category_names
end
