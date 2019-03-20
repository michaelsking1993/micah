class Project < ApplicationRecord
  has_many :features, dependent: :destroy
  belongs_to :user, optional: true
end
