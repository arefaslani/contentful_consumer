describe EntryNormalizer do
  context 'for chef entries' do
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
          "id": "NysGB8obcaQWmq0aQ6qkC",
          "type": "Entry",
          "createdAt": "2018-05-07T13:29:03.514Z",
          "updatedAt": "2018-05-07T14:19:02.570Z",
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
          "name": "Jony Chives"
        }
      }.to_json
    }
    
    subject { described_class.represent(Entry.new).from_json(json) }
    
    it 'fills in id' do
      expect(subject.id).to eq 'NysGB8obcaQWmq0aQ6qkC'
    end

    it 'fills in type' do
      expect(subject.type).to eq 'chef'
    end

    it 'fills in name' do
      expect(subject.name).to eq 'Jony Chives'
    end
  end

  context 'for tag entries' do
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
          "id": "2uPXLn31U8A68wQkGA06e8",
          "type": "Entry",
          "createdAt": "2018-05-07T13:28:04.129Z",
          "updatedAt": "2018-05-07T13:28:04.129Z",
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
          "name": "nuts free"
        }
      }.to_json
    }
    
    subject { described_class.represent(Entry.new).from_json(json) }
    
    it 'fills in id' do
      expect(subject.id).to eq '2uPXLn31U8A68wQkGA06e8'
    end

    it 'fills in type' do
      expect(subject.type).to eq 'tag'
    end

    it 'fills in name' do
      expect(subject.name).to eq 'nuts free'
    end
  end

  context 'for recipe entries' do
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
          "id": "4dT8tcb6ukGSIg2YyuGEOm",
          "type": "Entry",
          "createdAt": "2018-05-07T13:38:22.351Z",
          "updatedAt": "2018-05-07T13:41:01.986Z",
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
              "id": "recipe"
            }
          },
          "locale": "en-US"
        },
        "fields": {
          "title": "White Cheddar Grilled Cheese with Cherry Preserves & Basil",
          "photo": {
            "sys": {
              "type": "Link",
              "linkType": "Asset",
              "id": "61XHcqOBFYAYCGsKugoMYK"
            }
          },
          "chef": {
            "sys": {
              "type": "Link",
              "linkType": "Entry",
              "id": "NysGB8obcaQWmq0aQ6qkC"
            }
          },
          "calories": 788,
          "description": "*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!",
          "tags": [
            {
              "sys": {
                "type": "Link",
                "linkType": "Entry",
                "id": "3RvdyqS8408uQQkkeyi26k"
              }
            }
          ]
        }
      }.to_json
    }
    
    subject { described_class.represent(Entry.new).from_json(json) }
    
    it 'fills in id' do
      expect(subject.id).to eq '4dT8tcb6ukGSIg2YyuGEOm'
    end

    it 'fills in type' do
      expect(subject.type).to eq 'recipe'
    end

    it 'fills in title' do
      expect(subject.title).to eq 'White Cheddar Grilled Cheese with Cherry Preserves & Basil'
    end

    it 'fills in description' do
      expect(subject.description).to eq '*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!'
    end

    it 'fills in photo_id' do
      expect(subject.photo_id).to eq '61XHcqOBFYAYCGsKugoMYK'
    end

    it 'fills in chef_id' do
      expect(subject.chef_id).to eq 'NysGB8obcaQWmq0aQ6qkC'
    end

    it 'fills in tags_ids' do
      expect(subject.tags_ids).to eq ['3RvdyqS8408uQQkkeyi26k']
    end
  end
end
