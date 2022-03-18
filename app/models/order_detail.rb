class OrderDetail < ApplicationRecord
  belongs_to :order

  belongs_to :item

  enum create_status: {no_manufacture: 0, wait_construction: 1, under_construction: 2, complete_manufacture: 3}

end