class ProjectsController < ApplicationController
  def new
      @project = Project.new
  end

    def show
        @project = Project.find(params[:id])
    end

    def create
        @project = Project.new(project_params)
        if @project.save
          redirect_to @project
            # Handle a successful save.
        else
            render 'new'
        end
    end

  def index
    @projects = Project.all
  end

    private

    def project_params
        params.require(:project).permit(:name, :project_number_str, :project_description)
    end
end
