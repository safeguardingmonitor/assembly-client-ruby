module Assembly
  module Actions
    module List
      module ClassMethods
        def list(params, client=Assembly.client)
          response = client.get(path, params)
          Util.build(response, client)
        end

        def all(params, client=Assembly.client)
          results = []
          page = 1
          while page
            ret = list({page: page, per_page: 100}.merge(params), client)
            results += ret.data
            page = ret.next_page
          end
          results
        end

        def total_count(params={}, client=Assembly.client)
          list({per_page: 1}.merge(params), client).total_count
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end