class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def filter
    @babysitter = Babysitter.new
  end
end
