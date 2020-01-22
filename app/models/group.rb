class Group < ApplicationRecord

  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true, length: { in: 1..255 }

end
