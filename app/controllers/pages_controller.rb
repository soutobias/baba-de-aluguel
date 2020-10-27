class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @babysitter = Babysitter.new
  end
end
