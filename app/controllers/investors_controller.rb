class InvestorsController < ApplicationController
  def destroy
    @investor = Investor.find params[:id]
    @investor.destroy
    redirect_to root_path
  end

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)
    
    if @investor.save
      flash[:notice] = t(".authorization_success")
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  private

    def investor_params
      params.require(:investor).permit(:name)
    end
end