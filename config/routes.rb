Baconbnb::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  
  resources :pads do 
    resources :amenities, :only => [:index]
  end
  
  resources :amenities, :only => [:create]
  
  root :to => "pads#index"
end
