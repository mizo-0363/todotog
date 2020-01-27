class Groupcard < ApplicationRecord
  belongs_to :grouplist

  validates :title, length: { in: 1..255 }
  validates :memo, length: { maximum: 1000 }

  enum status: %w(新規 作業中 完了)
end
