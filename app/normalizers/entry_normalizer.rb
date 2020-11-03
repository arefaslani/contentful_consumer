class EntryNormalizer < Representable::Decorator
  include Representable::JSON

  nested :sys do
    property :id
    nested :contentType do
      nested :sys do
        property :type, as: :id
      end
    end
  end

  nested :fields do
    property :name
    property :title
    property :description
    nested :photo do
      nested :sys do
        property :photo_id, as: :id
      end
    end
    nested :chef do
      nested :sys do
        property :chef_id, as: :id
      end
    end
    property :tags_ids,
      setter: ->(represented:, fragment:, **) do
        represented.tags_ids = fragment.map { |tag| tag.dig("sys", "id") }
      end,
      as: :tags,
      default: []
  end

  collection_representer class: Entry
end
