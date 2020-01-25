require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  include ApplicationHelper
  describe "商品詳細ページのレスポンス" do
    let(:taxon) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 4, taxons: [taxon]) }

    before do
      get potepan_product_path(product.id)
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status(:success)
    end

    it "product名を表示する" do
      expect(response.body).to include product.name
    end

    it "related_product名を表示する" do
      expect(response.body).to include related_products[1].name
    end
  end
end
