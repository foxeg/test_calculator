FactoryGirl.define do
  factory :investment do
    amount 1000000
    base_rate 30
    overdue_rate 45
    status "new"
    lendee
    factory :investment_company_1 do
      after(:create) do |investment|
        [191666.67,191666.67,191666.67,191666.67,191666.67,191666.65].each_with_index do |payment,period|
          investment.investment_plan_facts[period].update_attributes({amount_fact: payment})
        end
      end
    end
    factory :investment_company_2 do
      after(:create) do |investment|
        [191666.67,191666.67,191666.67,525000,0,0].each_with_index do |payment,period|
          investment.investment_plan_facts[period].update_attributes({amount_fact: payment})
        end
      end
    end
    factory :investment_company_3 do
      after(:create) do |investment|
        [191666.67,191666.67,208333.33,208333.33,208333.33,208333.33].each_with_index do |payment,period|
          investment.investment_plan_facts[period].update_attributes({amount_fact: payment})
        end
      end
    end
  end
end