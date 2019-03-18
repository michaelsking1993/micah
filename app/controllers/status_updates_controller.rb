class StatusUpdatesController < ApplicationController
  def new
    @status_update = StatusUpdate.new(feature_id: params[:feature_id])
  end

  def create
    @status_update = StatusUpdate.new(status_update_params)
    @status_update.save
    redirect_to @status_update.feature.project
  end

  private

  def status_update_params
    params.require(:status_update).permit(:title, :notes, :feature_id)
  end
end
