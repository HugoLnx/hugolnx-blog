module Infrastructure
  class SharingServicesHead
    extend NamedParameter

    attr_reader :title
    attr_reader :description
    attr_reader :image
    attr_reader :type
    attr_reader :url
    attr_reader :site_name
    attr_reader :facebook_app_token
    alias fb_token facebook_app_token

    LOGO_IMAGE_PATH = 'images/logo.png'
    FACEBOOK_APP_TOKEN = "100000637301295"
    SITE_NAME = "HugoLnx::Blog"
    TYPE = 'article'
    
    named def initialize(post,request,url)
      @title = post.title
      @description = post.description
      @image = File.join("#{request.protocol}#{request.host}",LOGO_IMAGE_PATH)
      @type = TYPE
      @url = url
      @site_name = SITE_NAME
      @facebook_app_token = FACEBOOK_APP_TOKEN
    end

    def to_hash
      instance_variables.inject({}) do |hash,ivar|
        attr = ivar.to_s[/[^@]*$/]
        hash.merge(attr => public_send(attr))
      end
    end
  end
end
