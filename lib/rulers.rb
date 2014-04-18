require "rulers/version"

module Rulers
  class Application
  	def call(env)
  		[200, { 'content-type' => 'text-html' }, ['Sent from Rulers']]
  	end
  end
end
