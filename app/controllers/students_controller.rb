class StudentsController < ApplicationController
  def index
    # byebug
    students = Student.all
    # byebug
    # render json: params[:name] != nil ? Student.where(first_name: params[:name]).or(Student.where(last_name: params[:name])) : students

    # if params[:name] != nil
    # specific_students = Student.where(first_name: params[:name]).or(Student.where(last_name: params[:name]))
    # if specific_students.length > 0
    #   render json: specific_students
    # else
    #   render json: Student.all
    # end
    # else
    #   render json: students
    # end


    # Using the hash.key?(key_name) method
    # if params.key?(:name)
    #   specific_students = Student.where(first_name: params[:name]).or(Student.where(last_name: params[:name]))
    #   if specific_students.length > 0
    #     render json: specific_students
    #   else
    #     render json: Student.all
    #   end
    # else
    #   render json: Student.all
    # end


    #ChatGPT's answer
    if params.key?(:name)
      name = params[:name].downcase  # Convert the name to lowercase (you can use upcase for uppercase)
      specific_students = Student.where("LOWER(first_name) = ? OR LOWER(last_name) = ?", name, name)
      if specific_students.length > 0
        render json: specific_students
      else
        render json: Student.all
      end
    else
      render json: Student.all
    end
    

    # render json: students
  end

  def show
    render json: Student.find(params[:id])
  end
end
