require_relative './abstract_calc'

module CalculatorModule
  class StringCalc < AbstractCalc
    def sum
      first_argument + second_argument
    end

    def minus
      first_argument.size - second_argument.size
    end

    def multiply
      first_argument * second_argument.size
    end

    def devide
      first_argument.size / second_argument.size
    end
  end
end
