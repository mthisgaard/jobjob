class Task < ApplicationRecord
  belongs_to :job
  validates :title, :company, :url, presence: true
end
