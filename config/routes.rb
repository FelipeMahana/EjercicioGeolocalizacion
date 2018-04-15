Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        # pasa por user, util para el sanitizador
        registrations: 'users/registrations'
      }
  get 'locations/get_location'

  get 'locations/find_address'

  root 'locations#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
