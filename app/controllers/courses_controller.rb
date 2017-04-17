class CoursesController < ApplicationController
before_filter :set_event, only: [:show, :edit, :update, :destroy]

def new
  @course = Course.new
end

def create
  @course = Course.new(course_params)
  respond_to do |format|
    if @course.save
      format.html { redirect_to courses_path, :notice => "Successfully created course" }
      format.js 
    else
      format.html { render :action => 'new' }
      format.js { render :action => 'new' }
    end
  end
end

def index
 @courses = Course.all
end

private

def course_params
  params.require(:course).permit(:title, :duration, :summary, course_materials_attributes: [:material, :id, :_destroy])
end

def set_course
  @course = Course.find(params[:id])
end
end