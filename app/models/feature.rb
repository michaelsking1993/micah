class Feature < ApplicationRecord
  has_many :steps, dependent: :delete_all
  belongs_to :project
  has_many :status_updates, dependent: :delete_all
end
