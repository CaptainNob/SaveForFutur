Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  
  # Chemins pour les packs kibrilles
  get 'pack_kibrilles', to: 'purchase_histories#index'
  post 'purchase_kibrilles_pack', to: 'purchase_histories#create'
  
  # Chemins pour la bibliothèque
  get 'bibliotheque', to: 'library#edit'
  post 'bibliotheque', to: 'library#update', as: 'library'
  
  # chemins pour les decks
  get 'decks', to: 'deck#index'
  get 'deck', to: 'deck#show', as: 'deck'
  get 'new_deck', to: 'deck#new', as: 'new_deck' 
  post 'create_deck', to: 'deck#create', as: 'create_deck'
  get 'edit_deck', to: 'deck#edit', as: 'edit_deck'
  post 'update_deck', to: 'deck#update', as: 'update_deck'
  post 'destroy_deck', to: 'deck#destroy', as: 'destroy_deck'
  
  root 'home#index'
  
  # match "*path", to: "application#routing_error", via: :all
end

# DEVOIRS BILEL :
# Chemin pour la bibliothèque a modifier
# Chemin pour les decks à modifier
