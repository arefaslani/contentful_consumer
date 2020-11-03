describe ApplicationService do
  def build_interactor(&block)
    interactor = Class.new.send(:include, described_class)
    interactor.class_eval(&block) if block
    interactor
  end
  
  context 'when included' do
    it 'adds the call method to the interactor class' do
      expect(build_interactor).to respond_to :call
    end

    describe '.call' do
      let(:interactor) do
        build_interactor do
          def execute(params)
            params
          end
        end
      end

      it 'returns the outcome of the execute method on the interactor class' do
        expect(interactor.call(1)).to eq 1
      end

      context 'when passing blocks' do
        let(:interactor) do
          build_interactor do
            def execute(params)
              Success(params)
            end
          end
        end

        context 'when the block does not call success or failure methods on the result object'  do
          it 'raises error' do
            block = proc do |result|
              result.success do |outcome|; end
            end

            expect { interactor.call(&block) }.to raise_error Dry::Matcher::NonExhaustiveMatchError
          end
        end

        context 'when execute method on the interactor class returns Success' do
          it 'executes success method in the passed block' do
            counter = 0
            
            block = proc do |result|
              result.success do |outcome|
                counter += 1
              end

              result.failure do |errors|; end
            end

            expect { interactor.call(&block) }.to change { counter }.from(0).to(1)
          end
        end

        context 'when execute method on the interactor class returns Failure' do
          let(:interactor) do
            build_interactor do
              def execute(params)
                Failure(params)
              end
            end
          end
          
          it 'executes failure method in the passed block' do
            counter = 0
            
            block = proc do |result|
              result.success do |outcome|; end

              result.failure do |errors|
                counter += 1
              end
            end

            expect { interactor.call(&block) }.to change { counter }.from(0).to(1)
          end
        end
      end
    end

    context 'when execute method is not defined on the interactor class' do
      it 'raises error' do
        expect { build_interactor.call }.to raise_error NoMethodError
      end
    end
  end
end
