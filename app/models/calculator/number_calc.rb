require_relative './abstract_calc'

module CalculatorModule
  class NumberCalc < AbstractCalc
    def sum
      first_argument + second_argument
    end

    def minus
      first_argument - second_argument
    end

    def multiply
      first_argument * second_argument
    end

    def devide
      first_argument / second_argument
    end
  end
end
