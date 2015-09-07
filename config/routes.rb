Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  root :to => "book#real_main"
 
  match ":controller(/:action(/:id))", :via => [:post, :get]
end
