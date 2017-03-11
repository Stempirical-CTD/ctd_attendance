class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]

  helper_method :sort_column

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @project = Project.includes(:students)
                      .order('students.first_name')
                      .find params[:id]
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :url, :description, :add_student, :remove_student)
    end

    def sort_column
      sort = params[:c]
      %w(name).include?(sort) ? sort : 'name'
    end
end