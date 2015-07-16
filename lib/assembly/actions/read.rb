module Assembly
  module Actions
    module Read
      module ClassMethods
        def fetch(id, client=Assembly.client)
          response = client.get("#{path}/#{id}")
          Util.build(response, client)
        end
        alias_method :find, :fetch
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end