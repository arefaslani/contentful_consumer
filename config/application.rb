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

    r.is 'recipes', String do |recipe_id|
      r.get do
        Recipes::Fetch.call(
          fetcher: ContentfulApi.new,
          normalizer: RecipesNormalizer,
          id: recipe_id
        ) do |result|
          result.success do |outcome|
            @recipe = outcome
            view 'recipes/show'
          end

          result.failure do |errors|
            # Show some error page
          end
        end
      end
    end
  end
end
