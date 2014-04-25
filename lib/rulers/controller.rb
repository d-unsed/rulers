module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      template = File.read("app/views/#{view_name}.html.erb")
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end
  end
end
