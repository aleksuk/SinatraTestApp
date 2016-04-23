require_relative './calculator/calculator_factory'

class Calculator < BaseModel
  
  include Mongoid::Document

  field :value1
  field :value2
  field :operation, type: String

  validates :operation, inclusion: { in: %w(sum minus divide multiply) }
  validates :value1, presence: true
  validates :value2, presence: true

  validate :check_calculation_result

  def result
    calc = CalculatorModule::CalculatorFactory.get_calc(value1, value2)
    calc.send(operation.to_sym)
  end

  private
    def check_calculation_result
      begin
        result
      rescue
        errors.add(:result, 'values or operation is invalid')
      end
    end

end