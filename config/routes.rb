Rails.application.routes.draw do
  get 'sections/index'
  get 'sections/new'
  get 'sections/show'
  get 'sections/edit'
  get 'sections/delete'
    resources :subjects do
        # adds the delete route which is not included in resources by default
        member do 
            get :delete
        end
    end

    resources :pages do
        member do 
            get :delete
        end
    end

    resources :sections do
        member do 
            get :delete
        end
    end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/google'
  get 'demo/escape_output'
  root 'demo#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
