class Job < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  enum status: { pending: 0, applied: 1, interview: 2, rejected: 3, offer: 4 }
end
