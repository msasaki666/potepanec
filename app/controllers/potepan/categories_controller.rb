class Potepan::CategoriesController < ApplicationController
  def show
    @taxonomies = Spree::Taxonomy.all
    @taxon = Spree::Taxon.find(params[:id])
    # rubocop:disable Style/MultilineTernaryOperator
    @products = @taxon.parent_id.nil? ? Spree::Product.includes(master: [:images, :default_price])
                                      : Spree::Taxon.find(params[:id]).products
    # rubocop:enable Style/MultilineTernaryOperator
  end
end
