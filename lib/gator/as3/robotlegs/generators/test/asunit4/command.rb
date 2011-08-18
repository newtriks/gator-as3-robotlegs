module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class CommandTestGenerator < Gator::AS3::TestGenerator
                  include Gator::Project
                  include WithRobotLegsTemplates

          define :command => "command",
                 :usage => "generate as3 robotlegs test command CLASS_NAME", :description => "Creates ASUnit4 command test."

          def template_file
           "as3/robotlegs/test/asunit4/command.as.tt"
          end

          def generate
            @package_name += ".components" unless @package_name == ""
            @class_name += "CommandTest"
            super
          end

          no_tasks {

          def instance_name
            @class_name.chomp("Test")
          end

          }

          end
        end
      end
    end
  end