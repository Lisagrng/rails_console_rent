class Review < ApplicationRecord
  belongs_to :console

  validates :content, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
end
