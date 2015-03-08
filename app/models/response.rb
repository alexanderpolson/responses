class Response < ActiveRecord::Base
  belongs_to :category

  def self.random_for_category(category, count = 1)
    Response.where(category: category).limit(count).order('RANDOM()').pluck(:content)
  end
end
