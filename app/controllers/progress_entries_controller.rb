class ProgressEntriesController < ApplicationController
  def index
  end

  def new
    @progress_entry = ProgressEntry.new(progress_entry_params)
  end

  def create
    @progress_entry = ProgressEntry.create(progress_entry_params)
    flash[:notice] = 'progress entry saved'
    redirect_to progress_entries_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def progress_entry_params
    params.require(:progress_entry).permit(:body, :user_id, :project_id)
  end
end
