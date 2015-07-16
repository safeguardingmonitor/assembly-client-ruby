module Assembly
  module Actions
    module List
      module ClassMethods
        def all(client=Assembly.client)
          response = client.get(path)
          Util.build(response, client)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end