module Recipes
  class Fetch
    include ApplicationService

    def execute(params)
      recipes = yield get_recipe(params)
      Success(recipes)
    end

    def validator
      Dry::Schema.Params do
        required(:id)
        required(:fetcher)
        required(:normalizer)
      end
    end

    private

    def get_recipe(fetcher:, normalizer:, id:, **)
      response = fetcher.entries({ 'sys.id' => id })
      
      return Failure(:fetch_failed) if response.code != 200
      
      Success(normalizer.parse(response.body).first)
    end
  end
end
