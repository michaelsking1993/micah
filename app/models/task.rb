class Task < ApplicationRecord
  has_many :steps, dependent: :destroy
  belongs_to :project
  has_many :status_updates, dependent: :destroy
end
