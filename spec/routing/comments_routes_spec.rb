require 'spec_helper'

describe 'Comments Routes' do
  describe 'GET /posts/4/comments/1' do
    it {{:get => "/posts/4/comments/1"}.should route_to :controller => 'comments', :action => 'show', :id => '1', :post_id => '4'}
  end

  describe 'GET /posts/4/comments' do
    it {{:get => "/posts/4/comments"}.should route_to :controller => 'comments', :action => 'index', :post_id => '4'}
  end

  describe 'POST /posts/4/comments' do
    it {{:post => "/posts/4/comments"}.should route_to :controller => 'comments', :action => 'create', :post_id => '4'}
  end
end
