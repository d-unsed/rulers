module Rulers
  class Application
    CONTENT_TYPE = { 'Content-Type' => 'text/html' }

    def call(env)
      response = case env['PATH_INFO']
                 when '/'
                   contents = File.read('public/index.html')
                   compose_response(200, contents)
                 when '/favicon.ico'
                   compose_response(404, nil)
                 end

      return response if response

      klass, action = get_controller_and_action(env['PATH_INFO'])
      controller = klass.new(env)

      call_action(controller, action)
    end

    private

    def call_action(controller, action)
      begin
        text = controller.send(action)
        compose_response(200, text)
      rescue Exception
        compose_response(500, 'Server error')
      end
    end

    def compose_response(status, text)
      [status, CONTENT_TYPE, [text]]
    end
  end
end
