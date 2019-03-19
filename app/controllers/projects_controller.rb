class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = current_user.projects.sort_by{|project| project.done ? 1 : 0 }
  end

  def show
    @features = @project.features.order(created_at: :asc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    flash[:success] = 'Project created! Get to work.'
    redirect_to @project
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

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :done)
  end
end
