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

      parsed_entries = normalizer.parse(response.body).entries
      parsed_assets = normalizer.parse(response.body).assets
      
      Success(aggregate_data(parsed_entries, parsed_assets))
    end

    def aggregate_data(entries, assets)
      recipes = entries.select { |entry| entry.type == 'recipe' }
      tags = entries.select { |entry| entry.type == 'tag' }
      chefs = entries.select { |entry| entry.type == 'chef' }
      
      recipes.map do |recipe|
        Recipe.new(
          id: recipe.id,
          photo_url: assets.find { |asset| asset.id == recipe.photo_id }.url,
          title: recipe.title,
          description: recipe.description,
          chef: chefs.find { |chef| chef.id == recipe.chef_id },
          tags: tags.select { |tag| recipe.tags_ids.include?(tag.id) },
        )
      end
    end
  end
end
