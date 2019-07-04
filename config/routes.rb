# == Route Map
#
#         Prefix Verb   URI Pattern                                       Controller#Action
#    new_session GET    /session/new(.:format)                            sessions#new
#        session DELETE /session(.:format)                                sessions#destroy
#                POST   /session(.:format)                                sessions#create
#          users POST   /users(.:format)                                  users#create
#       new_user GET    /users/new(.:format)                              users#new
#           user GET    /users/:id(.:format)                              users#show
#
# The route’s name plus _url is the routing helper method. e.g. session_url

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create, :show]
  end
end
