class Job < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, :status, :company, presence: true
  enum status: { pending: 0, applied: 1, interview: 2, rejected: 3, offer: 4 }, _default: 0
  has_one_attached :cv
  has_one_attached :cover_letter
  has_one_attached :job_posting
end
