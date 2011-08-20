module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class MediatorTestGenerator < Gator::AS3::TestGenerator
                  include Gator::Project
                  include WithRobotLegsTemplates

          define :command => "mediator",
                 :usage => "generate as3 robotlegs test mediator CLASS_NAME", :description => "Creates ASUnit4 mediator test."

          def template_file
           "as3/robotlegs/test/asunit4/mediator.as.tt"
          end

          def generate
            @view_package_name = @package_name.dup << ".components" unless @package_name == ""
            @view_class_name = @class_name.dup
            @package_name += ".mediators" unless @package_name == ""
            @class_name += @class_name.match(/Mediator$/) && "Test" || "MediatorTest"
           super
          end

          no_tasks {

            def instance_name
              @class_name.chomp("Test")
            end
            
            def view_package_name
              @view_package_name
            end

            def view_class_name
              @view_class_name
            end

           }

        end
      end
    end
  end
end