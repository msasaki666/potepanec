class Potepan::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxonomy.all
    @taxons = Spree::Taxon.all
    @taxon = @taxons.find(params[:id])
    @products = @taxon.parent_id.nil? ? Spree::Product.all : Spree::Taxon.find(params[:id]).products
  end
end
