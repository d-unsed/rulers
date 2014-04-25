module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      template =
        File.read("app/views/#{controller_name}/#{view_name}.html.erb")
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end

    def controller_name
      klass = self.class.to_s.gsub(/Controller$/, '')
      Rulers.to_underscore(klass)
    end
  end
end
