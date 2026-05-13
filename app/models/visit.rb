class Visit < ApplicationRecord
  belongs_to :arena
  belongs_to :user, optional: true

  enum status: { visited: 0, want_to_visit: 1 }

  validates :arena, presence: true
  validates :status, presence: true
end
