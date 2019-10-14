class StatusUpdatesController < ApplicationController
  before_action :set_status_update, only: [:update, :edit]

  def new
    @status_update = StatusUpdate.new(task_id: params[:task_id])
    @title = 'New Note'
    @form_path = 'status_updates/form'
    respond_to do |format|
      format.js { render file: 'layouts/form' }
    end
  end

  def create
    @status_update = StatusUpdate.new(status_update_params)
    @status_update.save!
    redirect_to projects_path(team_id: @status_update.task.project.team_id)
  end

  def edit
    @title = 'Edit Note'
    @form_path = 'status_updates/form'
    respond_to do |format|
      format.js { render file: 'layouts/form' }
    end
  end

  def update
    @status_update.update(status_update_params)
    flash[:notice] = 'Status updated'
    redirect_to projects_path(team_id: @status_update.task.project.team_id)
  end

  private

  def set_status_update
    @status_update = StatusUpdate.find(params[:id])
  end

  def status_update_params
    params.require(:status_update).permit(:title, :body, :task_id)
  end
end
