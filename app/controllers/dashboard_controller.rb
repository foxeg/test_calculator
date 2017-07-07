class DashboardController < ApplicationController
  def index
    if @autorized
    else
      redirect_to new_investor_path
    end
  end
end