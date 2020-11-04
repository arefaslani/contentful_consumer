class Application < Roda
  plugin :render, views: 'app/views', engine: 'html.erb'
  
  route do |r|
    r.root do
      Recipes::FetchList.call(
        fetcher: ContentfulApi.new,
        normalizer: RecipesNormalizer
      ) do |result|
        result.success do |outcome|
          @recipes = outcome
          view 'recipes/index'
        end

        result.failure(:fetch_failed) do |errors|
          # Show some error page
        end

        result.failure do |errors|
          # Show some error page
        end
      end
    end
  end
end
