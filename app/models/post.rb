class Post < ApplicationRecord
  belongs_to :cliant
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :cliant, through: :likes
  has_many :trainer, through: :likes

  def liked_by?(cliant)
    likes.where(cliant_id: cliant.id).exists?
  end

  with_options presence: true do
    validates :title
    validates :date
    validates :explanation
    validates :images
  end
end