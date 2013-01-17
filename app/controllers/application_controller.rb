class ApplicationController < ActionController::Base
  protect_from_forgery#Turn on request forgery protection. 
  #Bear in mind that only non-GET, HTML/JavaScript requests are checked.
end
