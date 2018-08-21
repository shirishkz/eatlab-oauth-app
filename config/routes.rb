Rails.application.routes.draw do
  devise_for :users,
             class_name: 'FormUser',
             controllers: { omniauth_callbacks: 'omniauth_callbacks',
                            registrations: 'registrations' }
  # resources :site, only: %i[index]
  root 'site#index'
end
