class NotesController < ApplicationController

  before_action :set_note, only: [:edit, :update, :destroy]

  def edit
    @title = 'Edit Note'
    @form_path = 'status_updates/form'
  end

  def update
    if @note.update(note_params)
      flash[:notice] = 'note updated'
    else
      flash[:error] = 'something went wrong, please contact admin.'
    end
  end

  def new
    @note = Note.new
    @title = 'New Note'
    @form_path = 'notes/form'
    respond_to do |format|
      format.js { render file: 'layouts/form' }
    end
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = 'note created'
    else
      flash[:error] = 'uh oh, something went wrong. please contact admin.'
    end
    redirect_to projects_path
  end

  def destroy
    @note.destroy
    redirect_to projects_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :team_id, :user_id)
  end
end
