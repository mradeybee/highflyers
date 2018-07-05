Rails.application.routes.draw do
  resources :courses, only: [:index, :create] do
    member do
      post 'register/:student_id', to: 'courses#register', as: :register
    end
  end

  resources :teachers, only: [:index, :create] do
    member do
      post 'score_student/:student_id', to: 'teachers#score_student', as: :score_student
    end
  end

  resources :students, only: [:index, :create] do
    member do
      post 'rate_teacher/:teacher_id', to: 'students#rate_teacher', as: :rate_teacher
    end
  end

  resources :high_flyers, only: :show do
    member do
      post '/rate/:teacher_id', to: 'high_flyers#rate', as: :rate
    end
  end
end
