class Potepan::ProductsController < ApplicationController
  MAX_NUMBER_RELATED_PRODUCTS = 4

  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.includes(master: [:images, :default_price]).sample(MAX_NUMBER_RELATED_PRODUCTS)
  end
end
