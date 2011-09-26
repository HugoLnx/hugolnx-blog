
class JammitController < ActionController::Base
  alias old_package package
  def package
    puts "TESTINGTESTINGTESTING"
    old_package
    never = (Date.today >> 36).httpdate
    response.headers["Expires"] = never
    response.headers["Last-Modified"] = WHEN_APPLICATION_UP.httpdate
  end
end
