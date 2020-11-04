module Recipes
  class FetchList
    include ApplicationService

    def execute(params)
      recipes = yield get_recipes(params)
      Success(recipes)
    end

    def validator
      Dry::Schema.Params do
        required(:fetcher)
        required(:normalizer)
      end
    end

    private

    def get_recipes(fetcher:, normalizer:, **)
      response = fetcher.entries
      
      return Failure(:fetch_failed) if response.code != 200
      
      Success(normalizer.parse(response.body))
    end
  end
end
