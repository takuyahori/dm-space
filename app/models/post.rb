class Post < ApplicationRecord
  belongs_to :cliant
  has_one_attached :image
end
