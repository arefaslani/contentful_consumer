require 'dry/matcher/result_matcher'
require 'dry-monads'

module ApplicationService
  module ClassMethods
    def call(params = {}, &block)
      service_outcome = self.new.execute(params)
      if block_given?
        Dry::Matcher::ResultMatcher.call(service_outcome, &block)
      else
        service_outcome
      end
    end
  end

  module InstanceMethods
    include Dry::Monads[:result, :do]

    def execute(params)
      yield validate_params(params)
      super(params)
    end
    
    def validate_params(params)
      if self.respond_to? :validator
        validation_outcome = self.validator.call(params)
  
        return Failure(validation_outcome.errors.to_h) if validation_outcome.failure?  
      end

      Success(params)
    end
  end

  def self.included(klass)  
    # Result mixin adds Failure and Success monads
    # Do monad is used to unwrap the Success or Failure objects value.
    # It also halts the execution of the (execute) method if there is any
    # Failure step.
    klass.prepend InstanceMethods
    klass.extend ClassMethods
  end
end
