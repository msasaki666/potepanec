class Potepan::CategoriesController < ApplicationController
  def show
    @categorized_products = Spree::Taxon.find(params[:id]).products || Spree::Taxon.all_products
  end
end
