class CoursesController < ApplicationController
    def show
        @course = Course.find(params[:id])
        render(:layout => "application.html.erb")
    end


    private
        def course_params
            params.require(:user).permit(:class_number, :name)
        end
end
