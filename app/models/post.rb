class Post < ApplicationRecord
  belongs_to :cliant, optional: true
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy 
  has_many :cliant, through: :likes, dependent: :destroy
  has_many :trainer, through: :likes, dependent: :destroy


  def liked_by?(cliant)
    likes.where(cliant_id: cliant.id).exists?
  end

  def liked_by?(trainer)
    likes.where(trainer_id: trainer.id).exists?
  end

  with_options presence: true do
    validates :title
    validates :date
    validates :explanation
    validates :images
  end
end