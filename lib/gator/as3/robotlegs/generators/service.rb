module Gator
  module AS3
    module RobotLegs

      class ServiceGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates

        define :command => "service",
               :usage => "generate as3 rl service CLASS_NAME", :description => "Creates RobotLegs Service class."

        def template_file
          "as3/robotlegs/service.as.tt"
        end

        def generate
         @package_name += ".components" unless @package_name == ""
         @class_name += "Service"
         super
        end

      end

    end
  end
end