class SiteController < ApplicationController
  def index
    @users = User.all.order(:id)
  end
end
