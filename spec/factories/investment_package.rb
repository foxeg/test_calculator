FactoryGirl.define do
  factory :investment_package do
    period 6
    investor
    after(:build) do |package|
      package.investments << FactoryGirl.create(:investment_company_1, investment_package: package)
      package.investments << FactoryGirl.create(:investment_company_2, investment_package: package)
      package.investments << FactoryGirl.create(:investment_company_3, investment_package: package)
    end
  end
end