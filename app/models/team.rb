class Team < ApplicationRecord
  has_many :users_teams
  has_many :users, through: :users_teams
end
