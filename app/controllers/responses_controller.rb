class ResponsesController < ApplicationController
  DEFAULT_COUNT = 5.freeze

  before_filter :verify_category

  def bomb
    @responses = Response.random_for_category(@category, params[:count] || DEFAULT_COUNT)
  end

  private
  def verify_category
    category_name = params.require(:category)
    @category = Category.where(name: category_name).take
    render_404 unless @category
  end
end
