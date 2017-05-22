Rails.application.routes.draw do
  resources :clients do
    collection do
      delete :delete_selected
    end
  end
  root 'clients#index'
end
