module Assembly
  module Util
    def self.underscore(str)
      str.scan(/[A-Z][a-z]*/).join("_").downcase
    end

    def self.models
      {
        list: List,

        assessment_point: AssessmentPoint,
        grade_set: GradeSet,
        grade: Grade,
        aspect: Aspect,
        result: Result,
      }
    end

    def self.build(response, client=nil)
      case response
      when Hash
        klass = response.has_key?(:object) ? models.fetch(response[:object].to_sym, ApiModel) : Model
        klass.construct_from(response, client)
      when Array
        response.map {|o| Util.build(o, client) }
      else
        response
      end
    end
  end
end