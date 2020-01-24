class Potepan::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxonomy.all
    @taxon = Spree::Taxon.find(params[:id])
    @products = Spree::Product.in_taxon(@taxon).includes(master: [:images, :default_price])
  end
end
