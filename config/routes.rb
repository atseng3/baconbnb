Baconbnb::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :index]
  resource :session, :only => [:create, :destroy, :new]
  
  resources :pads
  resources :details
  resources :amenities
  
  root :to => "static_pages#root"
end
