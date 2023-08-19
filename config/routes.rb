Rails.application.routes.draw do
  get 'parkings/index'
  get 'parkings/registration_numbers_by_color'
  get 'parkings/ticket_number_by_registration_number'
  get 'parkings/ticket_numbers_by_color'
  get 'parkings/park_car'
  get 'parkings/remove_car'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
