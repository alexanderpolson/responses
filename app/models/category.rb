class Category < ActiveRecord::Base

  def self.missing
    Category.where(name: '404').take
  end
end
