Rails.application.routes.draw do
  resources :gig_payments do
    put :set_completed, :on => :member

    # Equivalent to:

    # member do
    #   put :set_completed
    # end
  end

  resources :gigs do
    put :set_completed, :on => :member
  end

  resources :creators
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
