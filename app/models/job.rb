class Job < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, :company, :url, presence: true
  enum status: { pending: 0, applied: 1, interview: 2, rejected: 3, offer: 4 }
  has_one_attached :cv
  has_one_attached :cover_letter
end
