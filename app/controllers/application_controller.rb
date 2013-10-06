class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :intercept_html_requests

  private

  def intercept_html_requests
    puts "html request INTERCEPTED"
    render('search/index') if request.format == Mime::HTML
  end

end