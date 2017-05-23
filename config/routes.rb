# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clients do
    collection do
      delete :delete_selected
    end
  end
  resources :orders do
    collection do
      delete :delete_selected
    end
  end
  resources :products do
    collection do
      delete :delete_selected
    end
  end
  root 'clients#index'
end
