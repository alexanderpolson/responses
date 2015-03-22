require 'rails_helper'

describe ResponsesController, type: :controller do

  let(:default_category_name) { CategoryName.create(name: 'default', category: Category.create) }
  let(:default_category) { default_category_name.category }
  let(:category_name) { CategoryName.create(name: 'name', category: Category.create) }
  let(:category) { category_name.category }

  before(:each) do
    allow(CategoryName).to receive(:missing).and_return(default_category_name)
  end

  shared_examples_for 'setting the category' do |action|

    it 'sets the category' do
      allow(CategoryName).to receive_message_chain(:where, :take).and_return(category_name)
      get action, category: category_name.name
      expect(assigns(:category_name)).to eql(category_name)
    end

    it 'sets the category to the default when one is not specified' do
      get action
      expect(assigns(:category_name)).to eql(default_category_name)
    end

    it 'sets the category to the default when the one specified does not exist' do
      allow(CategoryName).to receive_message_chain(:where, :take).and_return(nil)
      get action, category: 'missing category'
      expect(assigns(:category_name)).to eql(default_category_name)
    end
  end

  describe "GET #bomb" do
    it_behaves_like 'setting the category', :bomb

    it "returns http success" do
      get :bomb
      expect(response).to have_http_status(:success)
    end

    it 'assigns responses correctly' do
      response = Response.create
      allow(Response).to receive(:random_for_category).and_return([response])
      get :bomb
      expect(assigns(:responses)).to eql([response])
    end
  end

  describe "GET #random" do
    it_behaves_like 'setting the category', :random

    it "returns http success" do
      get :random
      expect(response).to have_http_status(:success)
    end
  end

end
