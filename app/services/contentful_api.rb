class ContentfulApi
  include HTTParty

  base_uri "https://cdn.contentful.com/spaces/#{ENV.fetch('SPACE_ID')}/environments/#{ENV.fetch('ENVIRONMENT_ID')}"
  headers 'Authorization' => "Bearer #{ENV.fetch('ACCESS_TOKEN')}"
  default_params 'sys.contentType.sys.id' => 'recipe'

  def entries(params = {})
    self.class.get("/entries", query: params.to_h)
  end
end
