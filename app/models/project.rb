class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  def self.sorted_projects(object)
    all_projects = object.projects.includes(tasks: [:steps, :status_updates])

    done_projects, in_progress_projects = [], []

    all_projects.each{|proj| proj.done ? done_projects.push(proj) : in_progress_projects.push(proj)}
    #DRY-ify this.
    in_progress_projects.sort_by(&:created_at) + done_projects.sort_by(&:created_at)

  end
end
