class Comment < ApplicationRecord
  belongs_to :trainer
  belongs_to :cliant
  belongs_to :post
end
