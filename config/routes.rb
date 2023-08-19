Rails.application.routes.draw do
  resources :parkings do
    member do
      get :registration_numbers_by_color
      get :ticket_number_by_registration_number
      get :ticket_numbers_by_color
      post :park_car
      patch :remove_car
    end
  end  
end
