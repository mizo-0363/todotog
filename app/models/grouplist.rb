class Grouplist < ApplicationRecord

  validates :title, length: { in: 1..255 }

  belongs_to :user
  belongs_to :group
  # has_many :cards, dependent: :destroy

end
