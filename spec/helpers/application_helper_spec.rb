require 'rails_helper'

RSpec.describe "ApplicationHelper" do
  include ApplicationHelper
  describe "page title" do
    let(:product) { create(:custom_product) }

    it "has correct title" do
      expect(full_title(product.name)).to eq "Custom Product | BIGBAG Store"
    end
  end
end
