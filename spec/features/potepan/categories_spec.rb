require 'rails_helper'
RSpec.feature "Potepan::Categories", type: :feature do
  given(:taxonomy) { create(:taxonomy) }
  given(:taxon) { create(:taxon, taxonomy: taxonomy) }
  given!(:product) { create(:product, taxons: [taxon]) }
  given(:taxonomy2) { create(:taxonomy) }
  given(:taxon2) { create(:taxon, taxonomy: taxonomy2) }
  given!(:product2) { create(:product, taxons: [taxon2]) }

  scenario "カテゴリーページの確認と商品詳細ページへの移動" do
    visit potepan_category_path(taxon.id)
    expect(page).to have_title "#{taxon.name} - BIGBAG Store"

    within ".pageHeader" do
      expect(page).to have_selector 'h2', text: taxon.name
      expect(page).to have_selector 'a', text: "Home"
      expect(page).to have_selector 'a', text: "shop"
      expect(page).to have_selector 'li', text: taxon.name
    end

    within page.first ".productBox" do
      expect(page).to have_content product.name
      expect(page).not_to have_content product2.name
      expect(page).to have_content product.price
    end

    within page.first ".panel-body" do
      expect(page).to have_content taxonomy.name
      expect(page).to have_content taxonomy2.name
      expect(page).to have_content taxon.name
      expect(page).to have_content taxon2.name
      expect(page).to have_content taxon.products.count
      expect(page).to have_content taxon2.products.count
    end

    click_on product.name
    expect(current_path).to eq potepan_product_path(product.id)
    click_on "一覧ページへ戻る"
    expect(current_path).to eq potepan_category_path(taxon.id)
  end
end
