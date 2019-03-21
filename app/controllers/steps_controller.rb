class StepsController < ApplicationController
  before_action :set_step, only: [:destroy, :update, :edit]
  skip_before_action :verify_authenticity_token
  def new
    @step = Step.new(feature_id: params[:feature_id])
  end

  def create
    @step = Step.new(step_params)
    @step.save
    flash[:notice] = 'Step added -  knock \'em out'
    redirect_to projects_path
  end

  def edit
  end

  def check_step
    @step = Step.find(params[:step_id])
    is_done = (@step.done ? false : true) #reverse it from whatever it currently is
    @step.update(done: is_done)
    flash[:notice] = is_done ? 'Nice! Keep it up' : 'Right back at \'em'
    redirect_to projects_path(step_id: @step.id)
  end

  def update
    #@step.update(step_params)
    @step.update(title: params['title'])
    #flash[:notice] = 'step updated'
    #redirect_to projects_path(step_id: @step.id)
  end

  def destroy
    @step.destroy
    flash[:notice] = 'Step removed'
    redirect_to projects_path
  end

  private

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:title, :description, :done, :feature_id)
  end
end
