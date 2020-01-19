require 'rails_helper'
RSpec.feature "Potepan::Products", type: :feature do
  given(:taxon) { create(:taxon) }
  given!(:product) { create(:product, taxons: [taxon]) }

  scenario "商品詳細ページの確認" do
    visit potepan_product_path(taxon.id)
    expect(page).to have_title "#{product.name} - BIGBAG Store"

    within ".pageHeader" do
      expect(page).to have_selector 'h2', text: product.name
      expect(page).to have_selector 'a', text: "Home"
      expect(page).to have_selector 'li', text: product.name
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

  scenario "page has right contents" do
    visit potepan_product_path product.id
    click_on '一覧ページへ戻る'
    expect(current_path).to eq potepan_category_path(taxon.id)

    expect(page).to have_title "- BIGBAG Store"
    expect(page).to have_selector 'h2', text: taxon.name
    expect(page).to have_selector 'a', text: "Home"
    expect(page).to have_selector 'a', text: "shop"
    expect(page).to have_selector 'li', text: taxon.name

    within page.first ".panel-body" do
      expect(page).to have_content taxonomy.name
      expect(page).to have_content taxon.name
      expect(page).to have_content taxonomy2.name
      expect(page).to have_content taxon2.name
    end

    within page.first ".productBox" do
      expect(page).to have_content product.name
      expect(page).to have_content product.price
      expect(page).not_to have_content product2.name
      click_on product.name
      expect(current_path).to eq potepan_product_path(product.id)
    end
  end
end
