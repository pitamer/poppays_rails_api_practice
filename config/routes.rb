Rails.application.routes.draw do
  resources :creators
  resources :gigs
  resources :gig_payments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
