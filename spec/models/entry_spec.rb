describe Entry do
  it { should respond_to :id }
  it { should respond_to :type }
  it { should respond_to :name }
  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :photo_id }
  it { should respond_to :chef_id }
  it { should respond_to :tags_ids }
end
