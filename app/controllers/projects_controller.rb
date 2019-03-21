class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    all_projects = current_user.projects.includes(features: [:steps, :status_updates])

    done_projects, in_progress_projects = [], []

    all_projects.each{|proj| proj.done ? done_projects.push(proj) : in_progress_projects.push(proj)}

    done_projects.sort_by!{|proj| proj.created_at}
    in_progress_projects.sort_by!{|proj| proj.created_at}

    @projects = in_progress_projects + done_projects

    if params[:step_id].present?
      step_id = params[:step_id].to_i
      project = Step.includes(feature: [:project]).find(step_id).feature.project
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
    @features = @project.features.order(created_at: :asc)
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

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :done)
  end
end
