class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true


  has_many :projects, dependent: :nullify
  has_many :tasks, through: :projects
  has_many :users_teams
  has_many :teams, through: :users_teams
  has_many :notes

  def next_up
    tasks.select(&:now).sort_by{ |task| [task.order_of_importance ? 0 : 1, task.order_of_importance] }
  end

  def sorted_projects
    sort_projects
  end

  def sort_projects
    Project.sort_projects(projects.where(team_id: nil))
  end

end
