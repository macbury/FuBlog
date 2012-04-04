Fublog::Application.routes.draw do
  match "/auth/new" => "sessions#new", as: :login
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"
  
  scope "admin", :as => "admin", :module => "admin" do
    root to: "admin#admin_panel"
    resources :entries do
      get :groups, on: :collection
    end
  end
  #match "/admin" => "entries#admin"

  resources :entries do
    get :drafts, on: :collection
  end

  match "/:id" => "entries#show", :as => :entry
  match "/:id/edit" => "entries#edit", :as => :edit_entry
  root to: 'entries#index'
end
