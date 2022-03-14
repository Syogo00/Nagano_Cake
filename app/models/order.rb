class Order < ApplicationRecord

  belongs_to :customer

  enum payment_method: {credit_card: 0, transfer: 1}
  enum status: {wait_deposit: 0, payment_confirmation: 1, under_construction: 2, preparation_for_shipment: 3, already_sent: 4}

end
