class StepsController < ApplicationController
  before_action :set_step, only: [:destroy, :update, :edit]
  skip_before_action :verify_authenticity_token
  def new
    @step = Step.new(task_id: params[:task_id])
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
    if params['title'].present?
      #temporarily do it like this to allow for update through both routes.
      #TODO: figure out how to format strong params from coffeescript/javascript/jquery/Rails.ajax (with ajax)
      @step.update(title: params['title'])
    else
      @step.update(step_params)
    end
    flash[:notice] = 'step updated'
    redirect_to projects_path(step_id: @step.id)
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
    params.require(:step).permit(:title, :description, :done, :task_id)
  end
end
