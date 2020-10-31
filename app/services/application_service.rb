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

  def self.included(klass)  
    # Result mixin adds Failure and Success monads
    # Do monad is used to unwrap the Success or Failure objects value.
    # It also halts the execution of the (execute) method if there is any
    # Failure step.
    klass.prepend Dry::Monads[:result, :do]
    klass.extend ClassMethods
  end
end
