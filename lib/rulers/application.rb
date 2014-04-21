module Rulers
  class Application
    def call(env)
      klass, action = get_controller_and_action(env['PATH_INFO'])
      controller = klass.new(env)
      text = controller.send(action)

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end
end
