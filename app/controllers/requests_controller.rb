require 'http'

class RequestsController

  def put(url, params)
    HTTP.put(url, form: params)
  end

end
