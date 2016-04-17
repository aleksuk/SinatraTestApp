module CalculatorModule
  class AbstractCalc
    attr_accessor :first_argument,
                  :second_argument

    def initialize(first_argument, second_argument)
      self.first_argument, self.second_argument = first_argument, second_argument
    end

    def sum
      raise NotImplementedError
    end

    def minus
      raise NotImplementedError
    end

    def multiply
      raise NotImplementedError
    end

    def devide
      raise NotImplementedError
    end
  end
end
