module Gator
  module AS3
    module RobotLegs

      class ModelGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator

        define :command => "model",
               :usage => "generate as3 rl model CLASS_NAME", :description => "Creates RobotLegs Model class."

       def template_file
        "as3/robotlegs/model.as.tt"
       end

       def generate
        @class_name += "Model"
        super
       end

      end

    end
  end
end