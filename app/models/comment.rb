class Comment < ApplicationRecord
  belongs_to :trainer, optional: true
  belongs_to :cliant, optional: true
  belongs_to :post

  with_options presence: true do
    validates :nickname
    validates :text
  end
end
