class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: %i(facebook twitter google)

         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.name = auth.info.name
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
          end
        end

  validates :name, presence: true, length: { maximum: 20 }

  has_many :lists, dependent: :destroy
end
