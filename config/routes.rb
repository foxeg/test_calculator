Rails.application.routes.draw do

  root 'dashboard#index'

  # TODO close unused routes
  resources :investors
  resources :lendees
  resources :investment_packages
  resources :investments do
    get :plan_payment, constraints: { format: :json }
    get :overdue_payment, constraints: { format: :json }
    get :early_payment, constraints: { format: :json }
  end

end
