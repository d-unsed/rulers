class TestController < Rulers::Controller
  def index
    'Index text'
  end

  def exception
    fail 'Ugly exception'
  end
end
