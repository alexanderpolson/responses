require 'rails_helper'

describe ResponsesController, type: :controller do

  let(:category_name) { 'name' }
  let(:category) { Category.create(name: category_name) }

  shared_examples_for 'setting the category' do |action|
    let(:default_category_name) { 'default' }
    let(:default_category) { Category.create(name: default_category_name) }

    before(:each) do
      allow(Category).to receive(:missing).and_return(default_category)
    end

    it 'sets the category' do
      allow(Category).to receive_message_chain(:where, :take).and_return(category)
      get action, category: category_name
      expect(assigns(:category)).to eql(category)
    end

    it 'sets the category to the default when one is not specified' do
      get action
      expect(assigns(:category)).to eql(default_category)
    end

    it 'sets the category to the default when the one specified does not exist' do
      allow(Category).to receive_message_chain(:where, :take).and_return(nil)
      get action, category: 'missing category'
      expect(assigns(:category)).to eql(default_category)
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
