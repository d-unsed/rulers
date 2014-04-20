require 'rulers/routing'
require 'rulers/version'

module Rulers
  class Application
  	def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new
      text = controller.send(action)

      [200, { 'Content-Type' => 'text/html' }, [text]]
  	end
  end
end
