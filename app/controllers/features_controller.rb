class FeaturesController < ApplicationController
  before_action :set_feature, only: [:edit, :update, :destroy]
  def new
    @feature = Feature.new(project_id: params[:project_id])
  end

  def create
    @feature = Feature.new(feature_params)
    @feature.save
    redirect_to @feature.project
  end

  def edit
  end

  def update
    @feature.update(feature_params)
    flash[:notice] = 'Task updated'
    redirect_to @feature.project
  end

  def destroy
    project = @feature.project
    @feature.destroy
    flash[:notice] = 'Task destroyed - on to the next one.'
    redirect_to projects_path
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:title, :description, :color, :done, :project_id)
  end
end
