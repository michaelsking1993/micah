module ProjectsHelper

  def sort_tasks(tasks)
    done_tasks, in_progress_tasks = [], []
    tasks.each{|task| task.done ? done_tasks.push(task) : in_progress_tasks.push(task)}

    done_tasks.sort_by!(&:created_at)
    in_progress_tasks.sort_by!(&:created_at)

    in_progress_tasks + done_tasks
  end
end
