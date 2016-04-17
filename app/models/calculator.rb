require_relative './calculator/calculator_factory'

class Calculator < Base

  OPERATIONS = %w(sum minus divide multiply)

  def self.calculate(value1, value2, action)
    is_valid_operation = OPERATIONS.any? do |el|
      el == action
    end

    if is_valid_operation
      calc = CalculatorModule::CalculatorFactory.get_calc(value1, value2)
      calc.send(action.to_sym)
    else
      raise StandardError.new, 'Invalid operation'
    end
  end

end