class BadgesController < ApplicationController
  def index
    @user_badges = current_user.user_badges
  end
end
