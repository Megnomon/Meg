Rails.application.routes.draw do
  get 'acount/mypage' => 'acount#mypage'
  get 'score/main' =>'score#main'
  get 'tweets/:id/consent' => "tweets#consent", as: "tweet_consent"
  get 'partscores/:id/consent' => "partscores#consent", as: "partscore_consent"
  get 'pbasses/:id/consent' => "pbasses#consent", as: "pbass_consent"
  get 'pdrums/:id/consent' => "pdrums#consent", as: "pdrum_consent"
  get 'pkeyboards/:id/consent' => "pkeyboards#consent", as: "pkeyboard_consent"
  get 'dictations/:id/consent' => "dictations#consent", as: "dictation_consent"
  get 'dbasses/:id/consent' => "dbasses#consent", as: "dbass_consent"
  get 'ddrums/:id/consent' => "ddrums#consent", as: "ddrum_consent"
  get 'dkeyboards/:id/consent' => "dkeyboards#consent", as: "dkeyboard_consent"
  get 'dchoruses/:id/consent' => "dchoruses#consent", as: "dchorus_consent"
  get 'music/main' => 'music#main'

  get 'tweets/new' => 'tweets#new'
  post 'tweets/create' => 'tweets#create'
  get 'tweets' => 'tweets#index'
  post 'tweets' => "tweets#index"

  get 'partscores/new' =>'partscores#new'
  post  'partscores/create' => 'partscores#create'
  get 'partscores' => 'partscores#index'
  post 'partscores' => "partscores#index"

  get 'pbasses/new' =>'pbasses#new'
  post  'pbasses/create' => 'pbasses#create'
  get 'pbasses' => 'pbasses#index'
  post 'pbasses' => "pbasses#index"

  get 'pdrums/new' =>'pdrums#new'
  post  'pdrums/create' => 'pdrums#create'
  get 'pdrums' => 'pdrums#index'
  post 'pdrums' => "pdrums#index"

  get 'pkeyboards/new' => 'pkeyboards#new'
  post 'pkeyboards/create' => 'pkeyboards#create'
  get 'pkeyboards' => 'pkeyboards#index'
  post 'pkeyboards/index' => "pkeyboards#index"

  get 'dictations/new' =>'dictations#new'
  post  'dictations/create' => 'dictations#create'
  get 'dictations' => 'dictations#index'
  post 'dictations' => "dictations#index"

  get 'dbasses/new' =>'dbasses#new'
  post  'dbasses/create' => 'dbasses#create'
  get 'dbasses' => 'dbasses#index'
  post 'dbasses' => "dbasses#index"

  get 'ddrums/new' =>'ddrums#new'
  post  'ddrums/create' => 'ddrums#create'
  get 'ddrums' => 'ddrums#index'
  post 'ddrums' => "ddrums#index"

  get 'dkeyboards/new' => 'dkeyboards#new'
  post 'dkeyboards/create' => 'dkeyboards#create'
  get 'dkeyboards' => 'dkeyboards#index'
  post 'dkeyboards' => "dkeyboards#index"

  get 'dchoruses/new' => 'dchoruses#new'
  post 'dchoruses/create' => 'pkeyboards#create'
  get 'dchoruses' => 'dchoruses#index'
  post 'dchoruses' => "dchoruses#index"

  post 'tweets' => "tweets#index"
  get 'tweets/complete' => 'tweets#complete'
  devise_for :users
  resources :users, only: [:index, :detail]
  resources :tweets, only: [:edit, :show, :update, :destroy]
  resources :partscores, only: [:edit, :show, :update, :destroy]
  resources :pbasses, only: [:edit, :show, :update, :destroy]
  resources :pdrums, only: [:edit, :show, :update, :destroy]
  resources :pkeyboards, only: [:edit, :show, :update, :destroy]
  resources :dictations, only: [:edit, :show, :update, :destroy]
  resources :dbasses, only: [:edit, :show, :update, :destroy]
  resources :ddrums, only: [:edit, :show, :update, :destroy]
  resources :dkeyboards, only: [:edit, :show, :update, :destroy]
  resources :dchoruses, only: [:edit, :show, :update, :destroy]

  delete 'users/sign_out' =>'users#sign_out'
  root 'music#main'

  post 'requests/:id/create' => 'requests#create', as: 'new_request'
  put 'requests/update' => 'requests#update'
  post 'pgrequests/:id/create' => 'pgrequests#create', as: 'new_pgrequest'
  put 'pgrequests/update' => 'pgrequests#update'
  post 'pbrequests/:id/create' => 'pbrequests#create', as: 'new_pbrequest'
  put 'pbrequests/update' => 'pbrequests#update'
  post 'pdrequests/:id/create' => 'pdrequests#create', as: 'new_pdrequest'
  put 'pdrequests/update' => 'pdrequests#update'
  post 'pkrequests/:id/create' => 'pkrequests#create', as: 'new_pkrequest'
  put 'pkrequests/update' => 'pkrequests#update'
  post 'dgrequests/:id/create' => 'dgrequests#create', as: 'new_dgrequest'
  put 'dgrequests/update' => 'dgrequests#update'
  post 'dbrequests/:id/create' => 'dbrequests#create', as: 'new_dbrequest'
  put 'dbrequests/update' => 'dbrequests#update'
  post 'ddrequests/:id/create' => 'ddrequests#create', as: 'new_ddrequest'
  put 'ddrequests/update' => 'ddrequests#update'
  post 'dkrequests/:id/create' => 'dkrequests#create', as: 'new_dkrequest'
  put 'dkrequests/update' => 'dkrequests#update'
  post 'dcrequests/:id/create' => 'dcrequests#create', as: 'new_dcrequest'
  put 'dcrequests/update' => 'dcrequests#update'

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end



end
