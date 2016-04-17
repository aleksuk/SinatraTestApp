module Template
  class Erb

    def initialize(context)
      @context = context
    end

    def render(folder, template, params = { type: 'json' })
      erb("app/views/#{folder}/#{template}.#{params[:type]}.erb").result(@context.get_binding)
    end

    private
      def erb(template)
        ERB.new(File.read(template))
      end

  end
end