describe RecipeNormalizer do
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
        "calories": 788,
        "description": "*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!",
      },
      "chef": {
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
      },
      "tags": [
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
        }
      ],
      "asset": {
        "sys": {
          "space": {},
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
      },
    }.to_json
  }
  
  subject { described_class.represent(Recipe.new).from_json(json) }
  
  it 'fills in id' do
    expect(subject.id).to eq '4dT8tcb6ukGSIg2YyuGEOm'
  end

  it 'fills in title' do
    expect(subject.title).to eq 'White Cheddar Grilled Cheese with Cherry Preserves & Basil'
  end

  it 'fills in description' do
    expect(subject.description).to eq '*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!'
  end

  it 'fills in asset' do
    expect(subject.asset).to be_instance_of Asset
  end

  it 'fills in chef' do
    expect(subject.chef).to be_instance_of Chef
  end

  it 'fills in tags' do
    expect(subject.tags).to all(be_instance_of(Tag))
  end
end
