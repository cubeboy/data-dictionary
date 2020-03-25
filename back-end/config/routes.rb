Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'word/index'
  # root 'word#index'

  resources :word, :term, :common_code
end
