describe ChefNormalizer do
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
          "id": "1Z8SwWMmS8E84Iogk4E6ik",
          "type": "Entry",
          "createdAt": "2018-05-07T13:28:25.324Z",
          "updatedAt": "2018-05-07T14:17:27.403Z",
          "environment": {
            "sys": {
              "id": "master",
              "type": "Link",
              "linkType": "Environment"
            }
          },
          "revision": 2,
          "contentType": {
            "sys": {
              "type": "Link",
              "linkType": "ContentType",
              "id": "chef"
            }
          },
          "locale": "en-US"
        },
        "fields": {
          "name": "Mark Zucchiniberg"
        }
      }.to_json
    }

    subject { described_class.new(Chef.new).from_json(json) }
  
    it 'fills in id' do
      expect(subject.id).to eq '1Z8SwWMmS8E84Iogk4E6ik'
    end

    it 'fills in created_at' do
      expect(subject.created_at).to eq '2018-05-07T13:28:25.324Z'
    end

    it 'fills in name' do
      expect(subject.name).to eq 'Mark Zucchiniberg'
    end
  end
end
