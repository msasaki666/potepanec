require 'rails_helper'
RSpec.feature "Potepan::Products", type: :feature do
  given(:taxon) { create(:taxon) }
  given!(:product) { create(:product, taxons: [taxon]) }

  scenario "商品詳細ページの確認" do
    visit potepan_product_path(product.id)
    expect(page).to have_title "#{product.name} - BIGBAG Store"

    within ".pageHeader" do
      expect(page).to have_selector 'h2', text: product.name
      expect(page).to have_selector 'a', text: "Home"
      expect(page).to have_selector 'li', text: product.name
    end

    within ".singleProduct" do
      expect(page).to have_css ".productSlider"
      expect(page).to have_content product.name
      expect(page).to have_content product.price
      expect(page).to have_content product.description
      expect(page).to have_link "一覧ページへ戻る"
    end
  end
end
