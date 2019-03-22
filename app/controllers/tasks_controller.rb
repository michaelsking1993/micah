class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def new
    @task = Task.new(project_id: params[:project_id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to projects_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    flash[:notice] = 'Task updated'
    redirect_to projects_path
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task destroyed - on to the next one.'
    redirect_to projects_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :color, :done, :project_id)
  end
end
