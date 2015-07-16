module Assembly
  class ApiModel < Model
    def path
      "#{self.class.path}/#{id}"
    end

    def self.path
      "/api/#{Util.underscore(self.class_name)}s"
    end
  end
end