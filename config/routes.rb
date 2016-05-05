Rails.application.routes.draw do

  # This is centralized place for all routes that need auth check
  # This allows us no longer need any code in controller to handle this logic
  authenticate :user do
    get '/project_research_fields/project/:project_id', to: 'project_research_fields#index', as: 'project_research_fields_index'
    post '/project_research_fields/add/:research_field/project/:project_id', to: 'project_research_fields#add', as: 'project_research_fields_add'
    get 'contributions/project/:project_id' => 'contributions#contribute', as: 'submit_completion'
    get 'dashboard' => 'dashboard#index'
    get 'contributions/:project_id' => 'contributions#complete', as: 'project_contributions'
    get 'contributions/add/project/:project_id/user/:user_id' => 'contributions#add', as: 'add_contribution_to_project'
    post 'contributions/add/project/:project_id/user/:user_id' => 'contributions#save', as: 'save_contribution_to_project'
    post '/profile_research_fields/add/:research_field', to: 'profile_research_fields#add', as: 'profile_research_fields_add'
    get 'project/team/:project_id' => 'teams#new', as: 'add_user_to_project'
    post 'team/project/:project_id/user/:user_id' => 'teams#create', as: 'add_user_team'
    delete 'team/project/remove/:project_id/user/:user_id' => 'teams#destroy', as: 'remove_user_team'

    get 'search/projects/' => 'projects#search'
    post 'search/projects/' => 'projects#search', as: 'search_interesting_projects'
    resources :teams
    resources :contributions
    resources :projects do
      resources :iterations
    end
    resources :profile_research_fields
    resources :profiles
    resources :project_research_fields
    resources :tasks
    get 'iteration/:iteration_id/tasks/new' => 'tasks#new', as: 'new_iteration_tasks'
    post 'iteration/:iteration_id/tasks/new' => 'tasks#create'
    get 'iteration/:iteration_id/task/:id/edit' => 'tasks#edit', as: 'edit_iteration_task'
    post 'iteration/:iteration_id/task/:id/edit' => 'tasks#edit'

    resources :requests
    post 'requests/project/:project_id/:request_type' => 'requests#make', as: 'make_request'
    post 'requests/:id/:type' => 'requests#action', as: 'take_request_action'
    get 'requests/:id/remove/points' => 'requests#leave', as: 'leave_request_remove_points'
    patch 'requests/:id/remove/points' => 'requests#approve_leave'

  end

  devise_for :users, controllers: { registrations: "registrations" }

  root 'static_pages#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
