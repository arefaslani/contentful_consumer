class RecipesNormalizer < Representable::Decorator
  include Representable::JSON

  property :items, parse_filter: ->(fragment, options) do
    RecipeNormalizer.for_collection.new([]).from_json(
      fragment.map do |recipe|
        {
          **recipe,
          chef: options
            .fetch(:doc)
            .dig('includes', 'Entry')
            .yield_self do |arr|
              next nil unless arr

              arr.find do |entry|
                entry.dig('sys', 'contentType', 'sys', 'id') == 'chef' &&
                  entry.dig('sys', 'id') == recipe.dig('fields', 'chef', 'sys', 'id')
              end
            end,
          tags: options
            .fetch(:doc)
            .dig('includes', 'Entry')
            .yield_self do |arr|
              next nil unless arr

              arr.select do |entry|
                entry.dig('sys', 'contentType', 'sys', 'id') == 'tag' &&
                  (recipe.dig('fields', 'tags') || [])
                    .map { |tag| tag.dig('sys', 'id') }
                    .include?(entry.dig('sys', 'id'))
              end
            end,
          asset: options
            .fetch(:doc)
            .dig('includes', 'Asset')
            .find do |asset|
              asset.dig('sys', 'id') == recipe.dig('fields', 'photo', 'sys', 'id')
            end
        }
      end.to_json
    )
  end

  def self.parse(json)
    new(OpenStruct.new).from_json(json).items
  end
end
