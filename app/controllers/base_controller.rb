class BaseController
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

    render nil, action: action
  end

  def render(path, **params)
    if !is_rendered && path.nil?
      self.result = render_json(get_default_path(params[:action]))
      self.is_rendered = true
    elsif !is_rendered && path.is_a?(String)
      self.result = render_json(get_path_prefix(path))
      self.is_rendered = true
    end

    self.result
  end

  protected
    def get_binding
      binding
    end

    def get_current_controller_name
      path = File.basename(self.class.to_s).split(/(?=[A-Z])/)
      path.select! { |el| el != 'Controller' }
      path.join('_').downcase
    end

    def get_default_path(action)
      "app/views/#{get_current_controller_name}/#{action}.json.jbuilder"
    end

    def render_json(path)
      Tilt::JbuilderTemplate.new(path).render(self)
    end

    def get_path_prefix(path)
      "app/views/#{path}.json.jbuilder"
    end

end