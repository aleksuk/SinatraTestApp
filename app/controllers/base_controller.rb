class BaseController
  include DataType

  attr_accessor :params,
                :request,
                :response,
                :env,
                :result,
                :is_rendered

  def initialize(**config)
    self.params = config[:params]
    self.request = config[:request]
  end

  def call(action)
    self.send(action)

    render get_current_controller_name, action.to_s
  end

  def render(folder, template)
    unless is_rendered
      self.result = Template::Erb.new(self).render(folder, template)
      self.is_rendered = true
    end

    self.result
  end

  def get_binding
    binding
  end

  private
    def get_current_controller_name
      path = File.basename(self.class.to_s).split(/(?=[A-Z])/)
      path.select! { |el| el != 'Controller' }
      path.join('-').downcase
    end

end