class HomeController < ApplicationController
  layout "application"
  before_filter :ensure_no_whitelabel
end
