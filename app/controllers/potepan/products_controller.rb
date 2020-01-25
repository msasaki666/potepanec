class Potepan::ProductsController < ApplicationController
  MAX_NUMBER_RELATED_PRODUCTS = 4

  def show
    @product = Spree::Product.find(params[:id])
    @related_products = Spree::Product.in_taxons(@product.taxons).distinct.where.not(id: @product.id).sample(MAX_NUMBER_RELATED_PRODUCTS)
  end
end
