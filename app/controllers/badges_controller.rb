class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @user_badges = current_user.user_badges
  end
end
