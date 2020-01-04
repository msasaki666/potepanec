require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  include ApplicationHelper
  describe "GET #show" do
    let(:product) { create(:base_product) }
    it "returns http success" do
      get :show, params: { id: product.id }
      expect(response).to have_http_status(:success)
    end
  end

end
