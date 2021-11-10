class Post < ApplicationRecord
  belongs_to :cliant
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :date
    validates :explanation
    validates :image
  end
end
