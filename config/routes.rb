Rails.application.routes.draw do
  get 'reports/consolidated_report_selection'
  post 'reports/consolidated_report'
  get 'reports/index_marks'
  post 'reports/generate_index_pdf'

  resources :choices
  resources :programmes
  resources :boards, shallow: true do
    resources :streams do
      resources :stream_subjects
    end
  end
  resources :guardians
  resources :occupations
  resources :qualifications
  resources :countries, shallow: true do
    resources :states do
      resources :districts
    end
  end
  resources :reservation_categories do
    resources :castes
  end
  resources :registration_forms
  resources :registration_steps
  resources :students

  get '/login' => 'sessions#new', as: :root
  get '/auth/:provider/callback' => 'sessions#create'
  post '/transaction/ccavRequestHandler'=> 'sessions#ccavRequestHandler'
  post '/transaction/ccavResponseHandler'=> 'sessions#ccavResponseHandler'
  delete '/auth/logout' => 'sessions#destroy'

  namespace :dashboard do
    get 'index'
    match 'instructions', via: [:get, :post]
    get 'personal'
    get 'address'
    get 'guardian'
    get 'weightages'
    get 'education'
    get 'payment'
    get 'marks'
    get 'choices'
    get 'submission'
    get 'photo_upload'
    get 'generate_application_pdf'
    get 'submission_done'
    get 'phase_completed'
    get 'update_menu'
  end
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
