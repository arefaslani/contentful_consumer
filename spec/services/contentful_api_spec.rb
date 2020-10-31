describe ContentfulApi do
  let(:space_id) { ENV.fetch('SPACE_ID') }
  let(:environment_id) { ENV.fetch('ENVIRONMENT_ID') }
  
  it 'responds to entries' do
    expect(subject).to respond_to :entries
  end

  describe '#entries' do
    let(:entries_url) { "/spaces/#{space_id}/environments/#{environment_id}/entries" }
    let(:entries_response) { instance_double(HTTParty::Response, body: {}, code: 200) }

    before do
      allow(described_class).to receive(:get).and_return(entries_response)
    end

    it 'fetches the entries from the contentful api' do
      subject.entries
      expect(described_class).to have_received(:get).with(entries_url)
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
