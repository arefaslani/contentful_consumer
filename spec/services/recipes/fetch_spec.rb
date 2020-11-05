describe Recipes::Fetch do
  it 'responds to call method' do
    expect(described_class).to respond_to :call
  end
  
  describe '.call' do
    it 'is invalid without fetcher param' do
      expect(described_class.call).to be_failure
      expect(described_class.call.failure).to have_key(:fetcher)
    end

    it 'is invalid without normalizer param' do
      expect(described_class.call).to be_failure
      expect(described_class.call.failure).to have_key(:normalizer)
    end

    it 'is invalid without id param' do
      expect(described_class.call).to be_failure
      expect(described_class.call.failure).to have_key(:id)
    end

    context 'with valid params' do
      let(:json_response) do
        {
          "sys": {
            "type": "Array"
          },
          "total": 28,
          "skip": 0,
          "limit": 100,
          "items": [
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
            }
          ],
          "includes": {
            "Entry": [
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
              },
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
              }
            ],
            "Asset": [
              {
                "sys": {
                  "space": {
                    "sys": {
                      "type": "Link",
                      "linkType": "Space",
                      "id": "kk2bw5ojx476"
                    }
                  },
                  "id": "61XHcqOBFYAYCGsKugoMYK",
                  "type": "Asset",
                  "createdAt": "2018-05-07T13:37:53.784Z",
                  "updatedAt": "2018-05-07T13:37:53.784Z",
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
                  "title": "SKU1240 hero-374f8cece3c71f5fcdc939039e00fb96",
                  "file": {
                    "url": "//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
                    "details": {
                      "size": 194737,
                      "image": {
                        "width": 1020,
                        "height": 680
                      }
                    },
                    "fileName": "SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
                    "contentType": "image/jpeg"
                  }
                }
              }
            ]
          }
        }.to_json
      end

      before do
        uri = Addressable::Template.new(
          'https://cdn.contentful.com/spaces/{space_id}/environments/{environment_id}/entries'
        )

        stub_request(:get, uri)
          .with(query: { 'sys.contentType.sys.id' => 'recipe', 'sys.id' => '4dT8tcb6ukGSIg2YyuGEOm' })
          .to_return(body: json_response)
      end
      
      subject do
        described_class.call(
          fetcher: ContentfulApi.new,
          normalizer: RecipesNormalizer,
          id: '4dT8tcb6ukGSIg2YyuGEOm'
        )
      end

      it 'returns a success response' do
        expect(subject).to be_success
      end

      describe '#success' do
        it 'returns a recipe object' do
          expect(subject.success).to be_a(Recipe)
        end
      end
    end
  end
end
