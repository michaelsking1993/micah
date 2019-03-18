class Project < ApplicationRecord
  has_many :features, dependent: :delete_all
  belongs_to :user, optional: true
end
