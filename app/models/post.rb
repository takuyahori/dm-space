class Post < ApplicationRecord
  belongs_to :cliant
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_cliants, through: :likes, source: :cliant
  has_many :liked_trainers, through: :likes, source: :cliant

  with_options presence: true do
    validates :title
    validates :date
    validates :explanation
    validates :images
  end
end