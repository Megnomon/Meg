Rails.application.routes.draw do
  get 'acount/mypage' => 'acount#mypage'
  get 'score/main' =>'score#main'
  get 'tweets/consent' => "tweets#consent"

  get 'music/main' => 'music#main'
  get 'tweets/complete' => 'tweets#complete'
  devise_for :users
  resources :users, only: [:index, :detail]
  resources :tweets
  resources :partscores
  resources :pbasses
  resources :pdrums
  resources :pkeyboards
  resources :dictations
  resources :dbasses
  resources :ddrums
  resources :dkeyboards
  resources :dchoruses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: "users/sessions",
  # }
  delete 'users/sign_out' =>'users#sign_out'
  root 'music#main'

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  # get 'tweets/new' => 'tweets#new'
 #投稿し、ホームにリダイレクト
  # post 'tweets/new' => 'tweets#create'
 #投稿一覧
  # get 'tweets/index' => 'tweets#index'

  # get "tweets/:id/edit" => "tweets#edit"
  # put "tweets/:id/update" => "tweets#update"

  # get "tweets/:id" => "tweets#detail"


end
