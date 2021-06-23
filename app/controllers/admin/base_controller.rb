class Admin::TestController < ApplicationController
  layout 'admin'

  before_action :authentication_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Необходимо авторизоваться.' unless current_user.is_a?(Admin)
  end
end
