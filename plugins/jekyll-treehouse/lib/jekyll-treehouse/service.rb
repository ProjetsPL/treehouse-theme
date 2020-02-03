module Jekyll
  module Treehouse
    class Service
      attr_reader :result, :error

      def self.call(*args)
        new(*args).tap do |service|
          service.instance_eval do
            @result = call
          end
        end
      end

      def self.attributes(*attributes)
        @attributes = *attributes
      end

      def failure(error_type)
        @error = error_type
        raise error if error.is_a?(Class) && (error < Exception)
      end

      def success?
        @error.nil?
      end

      def initialize(args = {})
        attributes = self.class.instance_variable_get('@attributes') || []

        attributes.each do |attribute|
          instance_variable_set("@#{attribute}", args[attribute])
          self.class.send(:attr_reader, attribute)
        end
      end
    end
  end
end
