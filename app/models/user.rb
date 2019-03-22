class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :projects, dependent: :nullify


  def my_sorted_projects
    all_projects = self.projects.includes(tasks: [:steps, :status_updates])

    done_projects, in_progress_projects = [], []

    all_projects.each{|proj| proj.done ? done_projects.push(proj) : in_progress_projects.push(proj)}

    in_progress_projects.sort_by(&:created_at) + done_projects.sort_by(&:created_at)

  end
end
