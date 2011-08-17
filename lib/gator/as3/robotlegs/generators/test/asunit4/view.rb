module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class ViewTestGenerator < Gator::AS3::TestGenerator

          define :command => "view",
                 :usage => "generate as3 robotlegs view test CLASS_NAME", :description => "Creates ASUnit4 view test."

          def init
            super
            source_paths.unshift File.dirname(__FILE__) + "/../../../templates"
          end

          def template_file
            "as3/robotlegs/test/asunit4/view.as.tt"
          end

          def generate_klass_command
            ["robotlegs", definition[:command]]
          end

          def generate
            @package_name += ".components" unless @package_name == ""
            @class_name += "ViewTest"
            super
          end

          def update_suite
            invoke resolve_subcommand(["test", "suite"], ["as3", "klass"])
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