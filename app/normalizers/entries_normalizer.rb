class EntriesNormalizer < Representable::Decorator
  include Representable::JSON

  property :items, parse_filter: ->(fragment, _options) { EntryNormalizer.for_collection.new([]).from_json(fragment.to_json) }

  nested :includes do
    property :assets,
      parse_filter: ->(fragment, _options) { AssetNormalizer.for_collection.new([]).from_json(fragment.to_json) },
      as: :Asset
  end

  def self.parse(json)
    parsed_data = new(OpenStruct.new).from_json(json)
    OpenStruct.new(entries: parsed_data.items, assets: parsed_data.assets)
  end
end
