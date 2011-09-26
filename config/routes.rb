HugolnxBlog::Application.routes.draw do
  match '/jammit-assets/:package.:extension', :controller => 'my_jammit', :action => :package, :extension=>/.+/

  resources :comments, :only => :update

  namespace 'without_layout' do
    resources :posts, :only => :show, :path => ''
    resources :other_posts, :only => :show, :path => '/:location'
    resources :comments, :only => :edit
  end

  resources :posts, :only => [:index], :path => ''  do
    resources :comments, :only => :create
    get :show, :constraints => {:id => /\d+\-[\w-]+/}, :on => :member
    get '', :action => :redirect_to_right_path, :constraints => {:id => /\d+/}, :on => :member
    get 'feed', :controller => :posts, :action => :feed, :on => :collection
    get 'sitemap', :controller => :posts, :action => :sitemap, :on => :collection
  end

  match "/auth/failure" => "errors#show"
  match "/auth/:provider" => "sessions#setup"
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :other_posts, :only => [], :path => '/:location' do
    get :show, :on => :member
  end

  match "/nao-encontrado" => "errors#show", :message => Infrastructure::PostException::PostNotFoundedMessage
  match'/(*message)' => 'errors#show'
end
