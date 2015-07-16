module Assembly
  module Util
    def self.underscore(str)
      str.scan(/[A-Z][a-z]*/).join("_").downcase
    end

    def self.models
      {
        assessment_point: AssessmentPoint,
        grade_set: GradeSet,
        grade: Grade,
      }
    end

    def self.build(response, opts=nil)
      case response
      when Hash
        klass = response.has_key?(:object) ? models.fetch(response[:object].to_sym, ApiModel) : Model
        klass.construct_from(response, opts)
      when Array
        response.map {|o| Util.build(o, opts) }
      else
        response
      end
    end
  end
end