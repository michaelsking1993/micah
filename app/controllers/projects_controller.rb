class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :validate_user
  def index
    @projects = current_user.my_sorted_projects
    @now_tasks = @projects.flat_map(&:tasks).select(&:do_this_now)
    if params[:step_id].present?
      step_id = params[:step_id].to_i
      project = Step.includes(task: [:project]).find(step_id).task.project
      @active_project_index = nil
      @projects.each_with_index do |proj, index|
        if proj.id == project.id
          @active_project_index = index
        end
      end
    else
      @active_project_index = ''
    end
  end

  def show
    @tasks = @project.tasks.order(created_at: :asc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    flash[:success] = 'Project created! Get to work.'
    redirect_to projects_path
  end

  def edit
  end

  def update
    @project.update(project_params)
    flash[:notice] = 'Project updated'
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project destroyed'
    redirect_to projects_path
  end



  private

  def set_project
    @project = Project.find(params[:id])
  end

  def validate_user
    unless @current_user
      flash[:notice] = 'Sign up or login to access that page'
      redirect_to root_path
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :done)
  end
end
