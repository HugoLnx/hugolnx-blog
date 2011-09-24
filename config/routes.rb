HugolnxBlog::Application.routes.draw do
  resources :comments, :path_names => {:edit => :editar}, :only => [:edit,:update]

  match '/without_layout/:id', :controller => :without_layout_posts, :action => 'show'

  resources :posts, :only => [:index], :path => ''  do
    resources :comments
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
