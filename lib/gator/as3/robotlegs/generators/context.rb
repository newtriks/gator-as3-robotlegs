module Gator
  module AS3
    module RobotLegs

      class ContextGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates

        define :command => "context",
               :usage => "generate as3 rl context CLASS_NAME", :description => "Creates RobotLegs Context class."

       def template_file
         "as3/robotlegs/context.as.tt"
       end

       def generate
         @class_name += "Context"
         super
       end

      end

    end
  end
end