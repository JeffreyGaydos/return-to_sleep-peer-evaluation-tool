class CoursesController < ApplicationController
    def show
        @course = Course.find(params[:id])
        render(:layout => "application.html.erb")
    end 

    def index
        @course = Course.all
    end

    def create
        @course = Course.create(course_params)
        redirect_to "/Course/new"
    end


    private
        def course_params
            params.require(:user).permit(:class_number, :name)
        end
end
