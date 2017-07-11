class DashboardController < ApplicationController
  def index
    if @authorized
    else
      redirect_to new_investor_path
    end
  end
end