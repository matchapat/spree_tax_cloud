require 'builder'

class Spree::TaxCloudCartItem < ActiveRecord::Base

  belongs_to :line_item

  belongs_to :tax_cloud_transaction

  #validates :tax_cloud_transaction, :presence => true

  validates :index, :tic, :sku, :price, :quantity, :presence => true

  # attr_accessible :index, :tic, :sku, :price, :quantity, :line_item
  accepts_nested_attributes_for :line_item

  def to_hash
    {
      'Index' => index,
      'TIC' => tic,
      'ItemID' => sku,
      'Price' => price.to_s,
      'Qty' => quantity
    }
  end

  def tax_cloud_cart_item_params
    params.require(:index, :tic, :sku, :price, :quantity, :line_item)
  end

end