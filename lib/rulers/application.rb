module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end
      
      klass, action = get_controller_and_action(env['PATH_INFO'])
      controller = klass.new(env)
      text = controller.send(action)

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end
end
