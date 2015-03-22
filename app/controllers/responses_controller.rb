class ResponsesController < ApplicationController
  DEFAULT_COUNT = 5.freeze

  before_filter :set_category

  def bomb
    @responses = Response.random_for_category(@category, params[:count] || DEFAULT_COUNT)
    render formats: [:json]
  end

  def random
    @response = Response.random_for_category(@category).first
    render formats: [:json]
  end

  private
  def set_category
    category_name = params[:category]
    if(category_name.present?)
      @category = Category.where(name: category_name).take || Category.missing
    else
      @category = Category.missing
    end
  end
end
