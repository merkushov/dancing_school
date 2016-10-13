class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :verify_admin

  private
    def verify_admin
      redirect_to login_url unless logged_in?
    end
end