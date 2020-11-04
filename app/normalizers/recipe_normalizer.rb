class RecipeNormalizer < Representable::Decorator
  include Representable::JSON

  nested :sys do
    property :id
  end

  nested :fields do
    property :title
    property :description
  end

  property :chef, decorator: ChefNormalizer, class: Chef
  property :asset, decorator: AssetNormalizer, class: Asset
  collection :tags, decorator: TagNormalizer, class: Tag

  collection_representer class: Recipe
end
