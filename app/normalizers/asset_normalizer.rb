class AssetNormalizer < Representable::Decorator
  include Representable::JSON

  nested :sys do
    property :id
    property :type
    property :created_at, as: :createdAt
  end

  nested :fields do
    nested :file do
      property :url
    end
  end

  collection_representer class: Asset
end
