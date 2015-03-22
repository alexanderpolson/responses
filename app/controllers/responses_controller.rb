class ResponsesController < ApplicationController
  DEFAULT_COUNT = 5.freeze

  before_filter :set_category

  def bomb
    @responses = Response.random_for_category(@category_name.category, params[:count] || DEFAULT_COUNT)
    render formats: [:json]
  end

  def random
    @response = Response.random_for_category(@category_name.category).first
    render formats: [:json]
  end

  private
  def set_category
    category_name = params[:category]
    if(category_name.present?)
      @category_name = CategoryName.where(name: category_name).take || CategoryName.missing
    else
      @category_name = CategoryName.missing
    end
  end
end
