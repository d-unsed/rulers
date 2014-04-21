module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      klass, action = get_controller_and_action(env['PATH_INFO'])
      controller = klass.new(env)

      call_action(controller, action)
    end

    private

    def call_action(controller, action)
      begin
        text = controller.send(action)
        [200, { 'Content-Type' => 'text/html' }, [text]]
      rescue Exception
        [500, { 'Content-Type' => 'text/html' }, ['Server error']]
      end
    end
  end
end
