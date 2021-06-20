class Admin::TestController < ApplicationController

  layout 'admin'

  before_action :authentication_user!
  before_action :admin_required!

  private

  def admin_required!
    unless current_user.is_a?(Admin)
      redirect_to root_path, alert: 'Для просомтра этой страницы необходимо авторизоваться.'
    end
  end
  
end
