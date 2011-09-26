class MyJammitController < ApplicationController
  def package
    render :nothing => true
    response.body = File.read("public/assets/all_minified.js")
    response.headers['Content-Encoding'] = 'gzip'
  end
end
