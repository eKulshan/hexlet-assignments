# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN

  resources :post_comments, only: %i[destroy update edit]

  resources :posts do
    resources :post_comments, except: %i[index new show destroy edit]
  end
  # END
end
