class BaseController
  attr_accessor :result,
                :is_rendered

  def initialize(router)
    @router = router
  end

  def request
    @router.request
  end

  def params
    router.params
  end

  def response
    router.response
  end

  def call(action)
    self.send(action)

    render nil, action: action
  end

  def render(path, **params)
    unless is_rendered
      path ||= params[:action]
      self.result = render_json(get_path_prefix(path))
      self.is_rendered = true
    end

    router.status(params[:status]) if params[:status]

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

    def render_json(path)
      Tilt::JbuilderTemplate.new(path).render(self)
    end

    def get_path_prefix(path)
      full_path = get_partial_path(path)
      "app/views/#{full_path}.json.jbuilder"
    end

    def get_partial_path(path)
      if path.is_a?(String) && path.include?('/')
        path
      else
        "#{get_current_controller_name}/#{path}"
      end
    end

    def router
      @router
    end

end