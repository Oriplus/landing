Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es|fr/ do
    root "subscribers#new"
    resources :subscribers, only: [:create]
  end
end
