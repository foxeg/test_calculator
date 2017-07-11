require "rails_helper"

RSpec.describe InvestmentPackage, type: :model do

  it "should calculate correct fact rate" do
    ip = FactoryGirl.create(:investment_package)
    expect(ip.fact_rate).to be_within(1e-4).of(31.1111)
  end

  it "should calculate correct plan rate" do
    ip = FactoryGirl.create(:investment_package)
    expect(ip.plan_rate).to be_within(1e-4).of(30)
  end
end
