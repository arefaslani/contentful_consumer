describe Recipe do
  it { should respond_to :id }
  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :asset }
  it { should respond_to :chef }
  it { should respond_to :tags }
end
