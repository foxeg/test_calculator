require "rails_helper"

RSpec.describe InvestmentPackage, type: :model do

  let(:ip) {FactoryGirl.create(:investment_package)}

  context "calculate correct rates" do
    it "fact rate" do
      expect(ip.fact_rate).to be_within(1e-4).of(31.1111)
    end

    it "plan rate" do
      expect(ip.plan_rate).to be_within(1e-4).of(30)
    end
  end

  context "calculate correct payment" do
    let(:pf) {ip.investments.first.investment_plan_facts[3]}

    it "overdue payment" do
      expect(pf.amount_overdue).to be_within(0.011).of(208333.33)
    end

    it "early payment" do
      expect(pf.amount_early).to be_within(0.011).of(525000)
    end
  end
end
