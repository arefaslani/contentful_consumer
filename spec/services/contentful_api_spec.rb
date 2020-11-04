describe ContentfulApi do
  let(:space_id) { ENV.fetch('SPACE_ID') }
  let(:environment_id) { ENV.fetch('ENVIRONMENT_ID') }
  
  it 'responds to entries' do
    expect(subject).to respond_to :entries
  end

  describe '#entries' do
    let(:json_response) {
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
              "id": "5jy9hcMeEgQ4maKGqIOYW6",
              "type": "Entry",
              "createdAt": "2018-05-07T13:40:27.932Z",
              "updatedAt": "2018-05-07T13:40:27.932Z",
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
                  "id": "recipe"
                }
              },
              "locale": "en-US"
            },
            "fields": {
              "title": "Tofu Saag Paneer with Buttery Toasted Pita",
              "photo": {
                "sys": {
                  "type": "Link",
                  "linkType": "Asset",
                  "id": "48S44TRZN626y4Wy4CuOmA"
                }
              },
              "calories": 900,
              "description": "Saag paneer is a popular Indian dish with iron-rich spinach and cubes of paneer, an Indian cheese that is firm enough to retain it's shape, but silky-soft on the inside. We have reimagined Saag Paneer and replaced the \"paneer\" with crispy cubes of firm tofu, making this already delicious and nutritious vegetarian dish burst with protein. Toasted pita bread is served alongside as an ode to naan. Cook, relax, and enjoy! [VIDEO](https://www.youtube.com/watch?v=RMzWWwfWdVs)"
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
                "id": "48S44TRZN626y4Wy4CuOmA",
                "type": "Asset",
                "createdAt": "2018-05-07T13:39:06.171Z",
                "updatedAt": "2018-05-07T13:39:06.171Z",
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
                "title": "SKU1498 Hero 154 2 -adb6124909b48c69f869afecb78b6808-2",
                "file": {
                  "url": "//images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
                  "details": {
                    "size": 218803,
                    "image": {
                      "width": 1020,
                      "height": 680
                    }
                  },
                  "fileName": "SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
                  "contentType": "image/jpeg"
                }
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
    }

    let(:uri) {
      Addressable::Template.new(
        'https://cdn.contentful.com/spaces/{space_id}/environments/{environment_id}/entries'
      )
    }

    let(:response) {
      instance_double(HTTParty::Response, body: json_response, code: 200)
    }

    before do
      stub_request(:get, uri)
          .with(query: { 'sys.contentType.sys.id' => 'recipe' })
          .to_return(body: json_response)
    end

    it 'fetches the entries from the contentful api' do
      expect(described_class).to receive(:get).and_return(response)
      subject.entries
    end

    context 'response object' do
      it 'responds to body' do
        expect(subject.entries).to respond_to :body
      end
      
      it 'responds to code' do
        expect(subject.entries).to respond_to :code
      end
    end
  end
end
