class Application < Roda
  plugin :render, views: 'app/views', engine: 'html.erb'
  
  route do |r|
    r.root do
      view 'hello'
    end
  end
end
