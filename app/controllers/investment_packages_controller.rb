class InvestmentPackagesController < ApplicationController

  def new
    @investment_package = InvestmentPackage.new
    @investment_package.investments.build
  end

  def create
    @investment_package = InvestmentPackage.new(investment_package_params)
    
    if @investment_package.valid?
      if has_unique_lendee?
        @investment_package.save
        flash[:notice] = t(".investment_success")
        redirect_to root_path
      else
        @investment_package.errors.add(:investments, :not_unique_lendee, message: "not_unique_lendee")
        render 'new'
      end  
    else
      render 'new'
    end
  end

  def show
    @investment_package = InvestmentPackage.find(params[:id])
  end

  def index
    @investment_packages = InvestmentPackage.all
  end

  private

    def investment_package_params
      params.require(:investment_package).permit(:investor_id, :period, investments_attributes: [:id, :lendee_id, :amount, :base_rate, :overdue_rate, :status, :_destroy])
    end

    # to validate unsaved nested investments
    def has_unique_lendee?
      lendees = @investment_package.investments.map{|i| i.lendee_id}
      lendees.count == lendees.uniq.count
    end
end