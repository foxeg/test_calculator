class LendeesController < ApplicationController
  # def destroy
  #   @investor = Investor.find params[:id]
  #   @investor.destroy
  #   redirect_to root_path
  # end

  # def new
  #   @investor = Investor.new
  # end

  # def create
  #   @investor = Investor.new(investor_params)
    
  #   if @investor.save
  #     flash[:notice] = t(".authorization_success")
  #     redirect_to root_path
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  # end

  def index
    @lendees = Lendee.all
  end

  private

    def lendee_params
      params.require(:lendee).permit(:name)
    end
end