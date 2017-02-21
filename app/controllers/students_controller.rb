class StudentsController < ApplicationController
  before_action :authenticate_user!, :authorize_teacher!
  before_action :set_student, only: [:edit, :update, :destroy]
  after_action :verify_authorized

  helper_method :sort_column

  # GET /students
  def index
    @students = Student.order("#{sort_column} #{sort_direction}")
  end

  def show
    @student = Student.includes(attendances: [semester: [:course]])
                      .find params[:id]
    @semesters = @student.attendances.group_by &:semester
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: 'Student created'
    else
      render :new
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student updated'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student destroyed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:image, :first_name, :last_name, :slack_name, :notes)
    end

    def sort_column
      sort = params[:c]
      %w(first_name last_name slack_name).include?(sort) ? sort : 'first_name'
    end

    def authorize_teacher!
      authorize Student
    end
end
