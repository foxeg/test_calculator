class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_investor, :count_lendee

  def check_investor
    @authorized = Investor.last
  end

  def count_lendee
    @lendee_count = Lendee.all.count
  end
end
