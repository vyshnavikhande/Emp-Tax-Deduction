class EmployeesController < ApplicationController

  protect_from_forgery 

  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: { message: 'Employee details saved successfully' }, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def tax_deduction
    employee = Employee.find(params[:id])
    tax_data = ::CalculateTax.calculate_tax_deduction_for_employee(employee)

    render json: tax_data
  end

  private

  def employee_params
    params.permit(:first_name, :last_name, :email, :doj, :salary, phone_number: [])
  end
end
