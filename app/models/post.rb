class Post < ApplicationRecord
  belongs_to :cliant
  has_many_attached :images

  with_options presence: true do
    validates :title
    validates :date
    validates :explanation
    validates :images
  end
end