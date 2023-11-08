class Section < ApplicationRecord
  validates :title, presence: true

  belongs_to :to_do_list
  has_many :tasks, dependent: :destroy
end
