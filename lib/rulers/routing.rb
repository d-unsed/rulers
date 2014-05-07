module Rulers
  class Application
    def get_controller_and_action(path_info)
      _, controller, action, _ = path_info.split('/', 4)
      controller.capitalize! << 'Controller'
      [Object.const_get(controller), action]
    end
  end
end
