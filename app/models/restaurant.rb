class Restaurant < ApplicationRecord
  has_many :products
  belongs_to :user

  has_many :orders

  def total_of_products
    products.count
  end
end
