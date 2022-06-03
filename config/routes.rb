Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles do
        collection do
          get :searched
        end
      end
      resources :article_comments do
        collection do
          get :comment_search
        end
      end
    end
  end
end
