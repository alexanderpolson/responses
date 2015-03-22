class Category < ActiveRecord::Base
  MISSING = '404'.freeze

  has_many :responses

  def self.missing
    Category.where(name: MISSING).take
  end

end
