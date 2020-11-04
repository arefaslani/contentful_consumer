class ChefNormalizer < Representable::Decorator
  include Representable::JSON

  nested :sys do
    property :id
    property :created_at, as: :createdAt
  end

  nested :fields do
    property :name
  end

  collection_representer class: Chef
end
