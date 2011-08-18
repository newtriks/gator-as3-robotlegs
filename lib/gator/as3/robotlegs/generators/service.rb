module Gator
  module AS3
    module RobotLegs

      class ServiceGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator

        define :command => "service",
               :usage => "generate as3 rl service CLASS_NAME", :description => "Creates RobotLegs Service class."

        def template_file
          "as3/robotlegs/service.as.tt"
        end

        def generate
         @class_name += "Service"
         super
        end

      end

    end
  end
end