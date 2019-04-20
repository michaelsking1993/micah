class Team < ApplicationRecord
  has_many :users_teams
  has_many :users, through: :users_teams
  has_many :projects
  has_many :tasks, through: :projects
  has_many :notes

  def next_up
    tasks.select(&:now).sort_by{ |task| [task.order_of_importance ? 0 : 1, task.order_of_importance] }
  end

  def sorted_projects
    sort_projects
  end

  def sort_projects
    Project.sort_projects(projects)
  end
end
