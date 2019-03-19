class StatusUpdatesController < ApplicationController
  before_action :set_status_update, only: [:update, :edit]

  def new
    @status_update = StatusUpdate.new(feature_id: params[:feature_id])
  end

  def create
    @status_update = StatusUpdate.new(status_update_params)
    @status_update.save!
    redirect_to @status_update.feature.project
  end

  def edit
  end

  def update
    @status_update.update(status_update_params)
    flash[:notice] = 'Status updated'
    redirect_to @status_update.feature.project
  end

  private

  def set_status_update
    @status_update = StatusUpdate.find(params[:id])
  end

  def status_update_params
    params.require(:status_update).permit(:title, :notes, :feature_id)
  end
end
