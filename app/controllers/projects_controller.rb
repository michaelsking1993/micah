class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :validate_user


  def dashboard

  end

  def team
    #TEMPORARILY HARDCODE COCOMIO
    #TODO: this will throw an error on local databases. Make this change.
    @project = Project.find_by(title: 'CocoMío')
    #get other projects through CocoMío owner for now...
    @now_goals = @project.tasks.select(&:now)
    @projects = Project.all

  end


  def index

    @team_projects = Project.sorted_projects(current_team)
    @team_now_tasks = @team_projects.flat_map(&:tasks).select(&:now)
    @team_notes = current_team.notes.order(created_at: :desc)

    @my_projects = Project.sorted_projects(current_user).select{|proj| proj.team_id.nil?}
    @my_now_tasks = @my_projects.flat_map(&:tasks).select(&:now)


  end

  def show
    @tasks = @project.tasks.order(created_at: :asc)
  end

  def new
    team_id = (params['team'].eql?('true') ? current_team.id : nil)
    @project = Project.new(team_id: team_id)
    @title = 'New Project'
    @form_path = 'projects/form'
    respond_to do |format|
      format.js { render file: 'layouts/form' }
    end
  end

  def create
    @project = Project.new(project_params)
    @project.save
    flash[:success] = 'Project created! Get to work.'
    redirect_to projects_path
  end

  def edit
    @title = 'Edit Project'
    @form_path = 'projects/form'
    respond_to do |format|
      format.js { render file: 'layouts/form' }
    end
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
    unless current_user
      flash[:notice] = 'Sign up or login to access that page'
      redirect_to root_path
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :done, :team_id)
  end
end
