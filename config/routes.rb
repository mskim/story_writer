Rails.application.routes.draw do
  # Authentication routes (from Rails 8 generator)
  resource :session
  resources :passwords, param: :token

  # Dashboard
  root "dashboard#index"
  get "dashboard", to: "dashboard#index"

  # Stories with nested resources
  resources :stories do
    # Profile setup (step 2 after creating story)
    resource :profile, controller: "story_profiles", only: [ :new, :create, :edit, :update ]

    # Chapters belong to story
    resources :chapters do
      collection do
        post :generate
      end

      member do
        patch :move
      end

      # Sections belong to chapter
      resources :sections, controller: "story_sections" do
        member do
          patch :move
        end
      end
    end

    # Photos belong to story
    resources :photos, only: [ :index, :create, :destroy ]

    # Collaborations
    resources :collaborations, only: [ :index, :create, :destroy ]
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
