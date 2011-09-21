module FakeDatabaseInitializer
  module PostsDatabase
    extend self
    POSTS_DIRECTORY = 'app/views/posts/posts/'

    def configure_initialization
      Rails::Application.config.before_configuration do
        initialize
        set_instance_variable_in_post_to_first_request_after_application_starts
      end
    end

    def initialize
      @all = posts = Infrastructure::PostDsl.find_all_in(POSTS_DIRECTORY)
    end

    def set_instance_variable_in_post_to_first_request_after_application_starts
      Post.instance_variable_set(:@all, PostsDatabase.all)
    end
    
    def all
      @all
    end
  end
end

FakeDatabaseInitializer::PostsDatabase.configure_initialization
