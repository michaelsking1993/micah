class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :team, optional: true

  # Returns the project's tasks
  def sorted_tasks
    sort_tasks
  end

  # Returns the object's projects sorted by importance and whether in-progress/done/for later.
  def self.sort_projects(projects)
    all_projects = projects.includes(tasks: [:steps, :status_updates])

    done_projects, in_progress_projects = [], []

    all_projects.each{|proj| proj.done ? done_projects.push(proj) : in_progress_projects.push(proj)}
    #DRY-ify this.
    in_progress_projects.sort_by{ |task| [task.order_of_importance ? 0 : 1, task.order_of_importance] } + done_projects.sort_by{ |task| [task.order_of_importance ? 0 : 1, task.order_of_importance] }
  end


  def sort_tasks
    tasks = self.tasks

    done_tasks, in_progress_tasks = [], []
    tasks.each{|task| task.done ? done_tasks.push(task) : in_progress_tasks.push(task)}

    done_tasks.sort_by!{ |task| [task.order_of_importance ? 0 : 1, task.order_of_importance] }
    in_progress_tasks.sort_by!{ |task| [task.order_of_importance ? 0 : 1, task.order_of_importance] }

    in_progress_tasks + done_tasks
  end


end
