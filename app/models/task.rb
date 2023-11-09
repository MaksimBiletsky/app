class Task < ApplicationRecord
  include DashboardBroadcastable

  belongs_to :section
end
