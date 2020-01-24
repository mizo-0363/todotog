class Group < ApplicationRecord

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, dependent: :destroy
  has_many :grouplists, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { in: 1..255 }

end
