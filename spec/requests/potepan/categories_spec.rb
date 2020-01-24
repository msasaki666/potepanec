require 'rails_helper'

RSpec.describe "Potepan::Categoriess", type: :request do
  include ApplicationHelper
  describe "カテゴリーページのレスポンス" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, taxonomy: taxonomy) }
    let!(:product) { create(:product, taxons: [taxon]) }

    before do
      get potepan_category_path(taxon.id)
    end

    it "リクエストが成功する" do
      expect(response).to have_http_status(:success)
    end

    it "taxonomy名を表示する" do
      expect(response.body).to include taxonomy.name
    end

    it "taxon名を表示する" do
      expect(response.body).to include taxon.name
    end

    it "product名を表示する" do
      expect(response.body).to include product.name
    end
  end
end
