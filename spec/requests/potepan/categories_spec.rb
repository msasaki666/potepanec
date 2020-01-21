require 'rails_helper'

RSpec.describe "Potepan::Categoriess", type: :request do
  include ApplicationHelper
  describe "category page response" do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, taxonomy: taxonomy) }
    let!(:product) { create(:product, taxons: [taxon]) }

    before do
      get potepan_category_path(taxon.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
