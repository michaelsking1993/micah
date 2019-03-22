class Step < ApplicationRecord
  has_many :notes, dependent: :delete_all
  belongs_to :task
end
