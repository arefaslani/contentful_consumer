describe TagNormalizer do
  context 'given a valid json' do

    let(:json) {
      {
        "sys": {
          "space": {
            "sys": {
              "type": "Link",
              "linkType": "Space",
              "id": "kk2bw5ojx476"
            }
          },
          "id": "3RvdyqS8408uQQkkeyi26k",
          "type": "Entry",
          "createdAt": "2018-05-07T13:27:45.974Z",
          "updatedAt": "2018-05-07T13:27:45.974Z",
          "environment": {
            "sys": {
              "id": "master",
              "type": "Link",
              "linkType": "Environment"
            }
          },
          "revision": 1,
          "contentType": {
            "sys": {
              "type": "Link",
              "linkType": "ContentType",
              "id": "tag"
            }
          },
          "locale": "en-US"
        },
        "fields": {
          "name": "vegan"
        }
      }.to_json
    }

    subject { described_class.new(Tag.new).from_json(json) }
  
    it 'fills in id' do
      expect(subject.id).to eq '3RvdyqS8408uQQkkeyi26k'
    end

    it 'fills in created_at' do
      expect(subject.created_at).to eq '2018-05-07T13:27:45.974Z'
    end

    it 'fills in name' do
      expect(subject.name).to eq 'vegan'
    end
  end
end
