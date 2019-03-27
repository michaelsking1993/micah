class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true


  has_many :projects, dependent: :nullify
  has_many :users_teams
  has_many :teams, through: :users_teams


end
