class CalculatorsController <  ApplicationController

  def index
    @results = Calculator.all
  end

  def show
    @calculation_result = Calculator.find(params[:id])
  end

  def create
    calculator_values = cast_params

    @calculation_result = Calculator.new(calculator_values.merge!({ operation: params[:operation] }))

    if @calculation_result.save
      render :show
    else
      @errors = @calculation_result.errors
      render 'base/errors', status: 422
    end
  end

  def destroy
    @calculation_result = Calculator.find(params[:id])
    @calculation_result.destroy!

    render 'base/empty'
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
      { value1: val1.to_s, value2: val2.to_s }
    end

    def cast_to_number(val1, val2)
      { value1: val1.to_f, value2: val2.to_f }
    end

end