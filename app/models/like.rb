class Like < ApplicationRecord
  belongs_to :post
  belongs_to :cliant, optional: true
  belongs_to :trainer, optional: true

  validates_uniqueness_of :post_id, scope: :cliant_id
end
