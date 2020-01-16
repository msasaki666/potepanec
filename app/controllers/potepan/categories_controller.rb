class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @products = @taxon.parent_id.nil? ? Spree::Product.all : Spree::Taxon.find(params[:id]).products 
  end
end
