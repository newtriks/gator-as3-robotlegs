module Gator
  module MXML
    module RobotLegs
      module WithRobotLegsTemplates
        def self.included(base)
          base.extend(ClassMethods)
        end

        module ClassMethods
          def template_root
            File.dirname(__FILE__) + "/../templates"
          end
        end
      end
      
      module ActAsRobotLegsKlassGenerator
        def generate_test_command
          super.unshift "robotlegs"
        end
      end
      
      module ActAsRobotLegsTestGenerator
        def generate_klass_command
          ["robotlegs", definition[:command]]
        end

        def update_suite
          invoke resolve_subcommand(["test", "suite"])
        end
      end
      
    end
  end
end