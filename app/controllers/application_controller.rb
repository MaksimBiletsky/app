class ApplicationController < ActionController::Base
  default_form_builder TailwindFormBuilder

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user

  before_action :set_current_user, if: :user_signed_in?

  private

  def pundishing_user
    flash[:notice] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def set_current_user
    Current.user = current_user
  end
end
