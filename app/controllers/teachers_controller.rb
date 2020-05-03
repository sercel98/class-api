class TeachersController < ApplicationController

    before_action :set_teacher, only: [:show, :update ,:destory]

    #GET /teachers
    def index
        @teachers = Teacher.all
        json_response(@teachers)
    end

    #POST /teachers
    def create
        @teacher = Teacher.create!(teacher_params)
        json_response(@teacher, :created)
    end

    #GET /teachers/:id
    def show
        json_response(@teacher)
    end

    # PUT /teachers/:id
    def update
        @teacher.update(teacher_params)
        head :no_content
    end

    # DELETE /teachers/:id
    def destroy
        @teacher = Teacher.find(params[:id])
        @teacher.destroy
        head :no_content
    end

    private

    def teacher_params
      # whitelist params
      params.permit(:name, :email, :password)
    end
  
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

end
