Rails.application.routes.draw do
  resources :students, only: [:index, :create]
  resources :courses, only: [:index, :create]
  resources :teachers, only: [:index, :create]

  resources :high_flyers, only: :show do
    member do
      post '/rate/:teacher_id', to: 'high_flyers#rate', as: :rate
    end
  end
end
