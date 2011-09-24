require 'spec_helper'

describe 'Requests to WithoutLayout::CommentsController' do
  fixtures :users
  describe 'GET /without_layout/comments/1/edit' do
    before(:each) do
      comment = Comment.create!(:post_id => Post.all.first.id, :user_id => User.first.id, :content => 'testing')
      get "/without_layout/comments/#{comment.id}/edit"
    end
    it {should render_template 'without_layout/comments/_form'}
    it {should_not render_template 'layouts/application'}
  end
end

