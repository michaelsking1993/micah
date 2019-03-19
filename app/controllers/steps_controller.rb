class StepsController < ApplicationController
  before_action :set_step, only: [:destroy, :update, :edit, :check_step]
  def new
    @step = Step.new(feature_id: params[:feature_id])
  end

  def create
    @step = Step.new(step_params)
    @step.save
    flash[:notice] = 'Step added -  knock \'em out'
    redirect_to @step.feature.project
  end

  def edit
  end

  def check_step
    is_done = (@step.done ? false : true) #reverse it from whatever it currently is
    @step.update(done: is_done)
    flash[:notice] = is_done ? 'Nice! Keep it up' : 'Right back at \'em'
    redirect_to @step.feature.project
  end

  def update
    @step.update(step_params)
    flash[:notice] = 'step updated'
    redirect_to @step.feature.project
  end

  def destroy
    project = @step.feature.project
    @step.destroy
    flash[:notice] = 'Step removed'
    redirect_to project
  end

  private

  def set_step
    @step = Step.includes(feature: [:project]).find(params[:id])
  end

  def step_params
    params.require(:step).permit(:title, :description, :done, :feature_id)
  end
end
