class WithoutLayout::PostsBaseController < PostsBaseController
  def render_json_to_page_changes
    render 'posts/show.html.erb'
    response.content_type = "application/json"
    response.body = {
      :body => response.body,
      :title => @post.title,
      :sharing_head => @sharing_head.to_hash
    }.to_json
  end
end
