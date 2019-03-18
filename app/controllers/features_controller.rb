class FeaturesController < ApplicationController
  def new
    @feature = Feature.new(project_id: params[:project_id])
  end

  def create
    @feature = Feature.new(params.require(:feature).permit(:title, :description, :project_id))
    @feature.save
    redirect_to @feature.project
  end
end
