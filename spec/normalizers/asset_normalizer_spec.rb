describe AssetNormalizer do
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
          "id": "3TJp6aDAcMw6yMiE82Oy0K",
          "type": "Asset",
          "createdAt": "2018-05-07T13:30:06.967Z",
          "updatedAt": "2018-05-07T13:30:06.967Z",
          "environment": {
            "sys": {
              "id": "master",
              "type": "Link",
              "linkType": "Environment"
            }
          },
          "revision": 1,
          "locale": "en-US"
        },
        "fields": {
          "title": "SKU1503 Hero 102 1 -6add52eb4eec83f785974ddeac3316b7",
          "file": {
            "url": "//images.ctfassets.net/kk2bw5ojx476/3TJp6aDAcMw6yMiE82Oy0K/2a4cde3c1c7e374166dcce1e900cb3c1/SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg",
            "details": {
              "size": 216391,
              "image": {
                "width": 1020,
                "height": 680
              }
            },
            "fileName": "SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg",
            "contentType": "image/jpeg"
          }
        }
      }.to_json
    }

    subject { described_class.new(Asset.new).from_json(json) }
  
    it 'fills in id' do
      expect(subject.id).to eq '3TJp6aDAcMw6yMiE82Oy0K'
    end

    it 'fills in type' do
      expect(subject.type).to eq 'Asset'
    end

    it 'fills in created_at' do
      expect(subject.created_at).to eq '2018-05-07T13:30:06.967Z'
    end

    it 'fills in url' do
      expect(subject.url).to eq '//images.ctfassets.net/kk2bw5ojx476/3TJp6aDAcMw6yMiE82Oy0K/2a4cde3c1c7e374166dcce1e900cb3c1/SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg'
    end
  end
end
