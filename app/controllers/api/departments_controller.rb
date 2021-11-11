class Api::DepartmentsController < ApplicationController

  def index
    departments = Department.all
    if departments.empty?
      render json: {message: "No departments found"}, status: 404
    else
      render json: departments, each_serializer: Departments::IndexSerializer
    end
  end
end
