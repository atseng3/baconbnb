Baconbnb::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  
  resources :pads
  resources :details
  resources :amenities
  
  root :to => "pads#index"
end
