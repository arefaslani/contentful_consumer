class ContentfulApi
  include HTTParty

  base_uri 'https://cdn.contentful.com/'
  headers 'Authorization' => "Bearer #{ENV.fetch('ACCESS_TOKEN')}"

  def entries
    self.class.get("/spaces/#{ENV.fetch('SPACE_ID')}/environments/#{ENV.fetch('ENVIRONMENT_ID')}/entries")
  end
end
