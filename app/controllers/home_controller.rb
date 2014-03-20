class HomeController < ApplicationController
  def index
    @setting = Setting.first
  end

  def aboutUs
    @setting = Setting.first
  end
end
