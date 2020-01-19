require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  include ApplicationHelper
  describe "product detail page" do
    let(:taxon) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon]) }

    before do
      get potepan_product_path(product.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
