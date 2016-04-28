module Assembly
  class ApiModel < Model
    def path
      "#{self.class.path}/#{id}"
    end

    def self.path
      "/#{Util.underscore(self.class_name)}s"
    end
  end
end