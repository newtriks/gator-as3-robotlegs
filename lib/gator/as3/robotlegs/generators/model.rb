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
        @class_name += "Model" unless @class_name.match(/Model$/)
        super
       end
       
       def generate_test
        return unless options[:test]
        invoke resolve_subcommand(generate_test_command_fallback), ["#{package_and_class}Model"]
       end

      end

    end
  end
end