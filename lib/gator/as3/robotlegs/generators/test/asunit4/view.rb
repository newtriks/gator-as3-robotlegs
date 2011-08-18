module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class ViewTestGenerator < Gator::AS3::TestGenerator
          include Gator::Project
          include WithRobotLegsTemplates
          include ActAsRobotLegsKlassGenerator

          define :command => "view",
                 :usage => "generate as3 robotlegs view test CLASS_NAME", :description => "Creates ASUnit4 view test."

          def template_file
            "as3/robotlegs/test/asunit4/view.as.tt"
          end

          def generate
            @package_name += ".components" unless @package_name == ""
            @class_name += "Test"
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