require 'rails_helper'

RSpec.describe "Products", type: :request do
  include ApplicationHelper
  describe "product detail page" do
    let(:product) { create(:custom_product) }

    before do
      get potepan_product_path(product.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "has correct links" do
      assert_select "a[href=?]", potepan_index_path, count: 3
    end

    it "display product name" do
      expect(response.body).to include "Custom Product"
    end

    it "has correct title" do
      expect(full_title(product.name)).to eq "Custom Product | BIGBAG Store"
    end
  end
end
