class StudentsController < ApplicationController

  before_action :set_group
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /teachers/:teacher_id/groups/group:id/students
  def index
    json_response(@group.students)
  end

  # GET/teachers/:teacher_id/groups/group:id/students:id
  def show
    json_response(@students)
  end

  # POST /teachers/:teacher_id/groups
  def create
    @student.students.create!(student_params)
    json_response(@student, :created)
  end

  def update
    @student.update(student_params)
    head :no_content
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name, :age)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_student
    @student = @group.find_by!(id: params[:id]) if @student
  end
     
end
