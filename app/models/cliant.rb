class Cliant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omuniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :nickname
    validates :profile
    validates :diet_history
  end

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶー-龥々]+\z/, messege: 'には全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

end