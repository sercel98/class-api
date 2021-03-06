class GroupsController < ApplicationController

    before_action :set_teacher
    before_action :set_teacher_group, only: [:show, :update, :destroy]
  
    # GET /teachers/:teacher_id/groups
    def index
      json_response(@teacher.groups)
    end
  
    # GET /teachers/:teacher_id/groups:id
    def show
      json_response(@group)
    end
  
    # POST /teachers/:teacher_id/groups
    def create
      @teacher.groups.create!(group_params)
      json_response(@teacher, :created)
    end
  
    # PUT  /teachers/:teacher_id/groups:id
    def update
      @group.update(group_params)
      head :no_content
    end
  
    # DELETE  /teachers/:teacher_id/groups:id
    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      head :no_content
    end
  
    private
  
    def group_params
      params.permit(:code, :name, :area)
    end
  
    def set_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end
  
    def set_teacher_group
      @group = @teacher.groups.find_by!(id: params[:id]) if @teacher
    end
end
