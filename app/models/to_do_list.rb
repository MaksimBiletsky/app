class ToDoList < ApplicationRecord
  include DashboardBroadcastable

  acts_as_list

  validates :title, presence: true

  has_many :sections, dependent: :destroy
  belongs_to :user, default: -> { Current.user }

  default_scope { where(is_template: false) } 
  scope :templates, -> { unscoped.where(is_template: true) }
end
