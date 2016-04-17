require_relative './number_calc'
require_relative './string_calc'

module CalculatorModule
  class CalculatorFactory
    class << self
      def get_calc(arg1, arg2)
        if arg1.is_a?(Numeric) && arg2.is_a?(Numeric)
          NumberCalc.new(arg1, arg2)
        elsif arg1.is_a?(String) && arg2.is_a?(String)
          StringCalc.new(arg1, arg2)
        end
      end
    end
  end
end
