class Order < ApplicationRecord
  belongs_to :customer

  validates_presence_of :customer
  validates :product_name, presence: true
  validates :product_count, numericality: { greater_than: 0 }


end
