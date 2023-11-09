class Task < ApplicationRecord
  include DashboardBroadcastable

  belongs_to :section
  validates :title, presence: true
end
