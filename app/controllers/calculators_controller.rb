class CalculatorsController <  ApplicationController

  def show
    @operation = params[:operation]

    calculator_values = cast_params

    begin
      @result = Calculator.calculate(
        calculator_values[:value1],
        calculator_values[:value2],
        params[:operation]
      )
    rescue => e
      @error = e
      render('base', 'error')
    end
  end

  private
    def cast_params
      case params[:type]
        when 'string'
          cast_to_str params[:value1], params[:value2]
        when 'number'
          cast_to_number params[:value1], params[:value2]
        else
          cast_to_number params[:value1], params[:value2]
      end
    end

    def cast_to_str(val1, val2)
      {
        value1: val1.to_s,
        value2: val2.to_s
      }
    end

    def cast_to_number(val1, val2)
      {
        value1: val1.to_f,
        value2: val2.to_f
      }
    end

end