class StudentsController < ApplicationController

  def index
    # byebug
    students = Student.all
    # render json: params[:name] ? Student.where(first_name: params[:name]).or(Student.where(last_name: params[:name])) : students
    render json: students
  end

  def show
    render json: Student.find(params[:id])
  end

end
