class Potepan::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxonomy.all
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.parent_id.nil? ? Spree::Product.includes(master: [:images, :default_price]): @taxon.products
  end
end
