class InvestmentsController < ApplicationController

  def edit
    @investment = Investment.find(params[:id])
  end

  def update
    @investment = Investment.find(params[:id])
    if @investment.update(investment_params)
      if @investment.update_status
        flash[:notice] = t(".investment_payed")
      else
        flash[:notice] = t(".schedule_update_success")
      end
      redirect_to investment_package_path(@investment.investment_package)
    else
      render 'edit'
    end
  end

  def plan_payment
    pf = InvestmentPlanFact.where(investment_id: params[:investment_id], period_number: params[:period_number]).first
    render json: {amount: pf.amount_plan_payment}.to_json
  end

  def overdue_payment
    pf = InvestmentPlanFact.where(investment_id: params[:investment_id], period_number: params[:period_number]).first
    render json: {amount: pf.amount_overdue}.to_json
  end

  def early_payment
    pf = InvestmentPlanFact.where(investment_id: params[:investment_id], period_number: params[:period_number]).first
    render json: {amount: pf.amount_early}.to_json
  end

  private

    def investment_params
      params.require(:investment).permit(:id, :period_number, investment_plan_facts_attributes: [:id, :amount_fact])
    end

end