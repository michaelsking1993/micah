class StepsController < ApplicationController
  def new
    @step = Step.new(feature_id: params[:feature_id])
  end

  def create
    @step = Step.new(step_params)
    @step.save
    flash[:notice] = 'Step added -  knock \'em out'
    redirect_to @step.feature.project
  end

  def update
    @step = Step.includes(feature: [:project]).find(params[:id])
    is_done = (@step.done ? false : true) #reverse it from whatever it currently is
    @step.update(done: is_done)
    flash[:notice] = is_done ? 'Nice! Keep it up' : 'Cool, get back at it'
    redirect_to @step.feature.project
  end

  private

  def step_params
    params.require(:step).permit(:title, :description, :done, :feature_id)
  end
end
