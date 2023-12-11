class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :doj, :salary, presence: true
end
