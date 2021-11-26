class Api::DepartmentsController < ApplicationController
  def index
    Department.number_of_participants
    Department.calculate_average_score
    departments = Department.all

    if departments.empty?
      render json: { message: 'No departments found' }, status: 404
    else
      render json: departments, each_serializer: Departments::IndexSerializer
    end
  end
end
