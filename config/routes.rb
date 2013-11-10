Baconbnb::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :index]
  resource :session, :only => [:create, :destroy, :new]
  
  resources :pads do 
    resources :amenities, :only => [:index]
  end
  resources :photos, :only => [:create, :new]
  
  resources :attachments, :only => [:index, :create]
  
  resources :amenities, :only => [:create]
  
  resources :bookings, :only => [:edit, :update, :destroy, :create, :new] do
    member do 
      put 'approve'
      put 'deny'
    end
  end
  
  root :to => "pads#index"
end
