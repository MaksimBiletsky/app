class ToDoList < ApplicationRecord
  validates :title, presence: true

  has_many :sections, dependent: :destroy
  default_scope { where(is_template: false) } 
  scope :templates, -> { unscoped.where(is_template: true) }
end
