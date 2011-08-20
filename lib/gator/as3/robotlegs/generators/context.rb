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
         @class_name += "Context" unless input.match(/Context$/)
         super
       end
       
       def generate_test
         return unless options[:test]
         invoke resolve_subcommand(generate_test_command_fallback), ["#{package_and_class}Context"]
       end

      end

    end
  end
end