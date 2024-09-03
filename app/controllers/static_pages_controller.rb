class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: :home
  def home
    @active_nav_item = 'home'
  end
  def courses
    @active_nav_item = 'courses'
  end
end
