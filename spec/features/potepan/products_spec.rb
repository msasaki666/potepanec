require 'rails_helper'
RSpec.feature "Potepan::Products", type: :feature do
  given(:taxon) { create(:taxon) }
  given!(:product) { create(:product, taxons: [taxon]) }
  given!(:product2) { create(:product, taxons: [taxon]) }
  given(:taxon2) { create(:taxon) }
  given!(:product3) { create(:product, taxons: [taxon2]) }

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

    within ".productsContent" do
      expect(page).to have_css ".productImage"
      expect(page).to have_content product2.name
      expect(page).to have_content product2.price
      expect(page).not_to have_content product.name
      expect(page).not_to have_content product3.name
    end
save_and_open_page
    click_on product2.name
    expect(current_path).to eq potepan_product_path(product2.id)
  end
end
