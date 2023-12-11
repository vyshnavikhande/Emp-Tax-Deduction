class CalculateTax
  def self.calculate_tax_deduction_for_employee(employee)
    current_year = Date.today.year
    financial_year_start = Date.new(current_year - 1, 4, 1)
    financial_year_end = Date.new(current_year, 3, 31)

    tax_slabs = [
      { limit: 250000, rate: 0 },
      { limit: 500000, rate: 0.05 },
      { limit: 1000000, rate: 0.1 },
      { limit: Float::INFINITY, rate: 0.2 }
    ]

    yearly_salary = employee.salary * 12

    tax = calculate_tax(yearly_salary, tax_slabs)
    cess = calculate_cess(yearly_salary)

    {
      id: employee.id,
      first_name: employee.first_name,
      last_name: employee.last_name,
      yearly_salary: yearly_salary,
      tax_amount: tax,
      cess_amount: cess
    }
  end

  private

  def self.calculate_tax(yearly_salary, tax_slabs)
    remaining_salary = yearly_salary
    total_tax = 0
  
    tax_slabs.each do |slab|
      if remaining_salary > 0
        taxable_amount = [remaining_salary, slab[:limit]].min
        tax_for_slab = taxable_amount * slab[:rate]
        total_tax += tax_for_slab
        remaining_salary -= taxable_amount
      else
        break
      end
    end
  
    total_tax  
  end

  def self.calculate_cess(yearly_salary)
    if yearly_salary > 2500000
      excess_amount = yearly_salary - 2500000
      cess = excess_amount * 0.02
    else
      cess = 0
    end
  
    cess
  end
end