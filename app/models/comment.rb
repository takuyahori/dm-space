class Comment < ApplicationRecord
  belongs_to :trainer, optional: true
  belongs_to :cliant, optional: true
  belongs_to :post
end
