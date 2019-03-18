class StepsController < ApplicationController
  def new
    @step = Step.new(feature_id: params[:feature_id])
  end

  def create
    @step = Step.new(step_params)
    @step.save
    redirect_to @step.feature.project
  end

  def update
    @step = Step.includes(feature: [:project]).find(params[:id])
    @step.update(done: (@step.done ? false : true))
    redirect_to @step.feature.project
  end

  private

  def step_params
    params.require(:step).permit(:title, :description, :done, :feature_id)
  end
end
