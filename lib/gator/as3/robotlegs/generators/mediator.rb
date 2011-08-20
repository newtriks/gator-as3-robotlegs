module Gator
  module AS3
    module RobotLegs

      class MediatorGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator

        define :command => "mediator",
               :usage => "generate as3 rl mediator CLASS_NAME", :description => "Creates RobotLegs Mediator class."

        def template_file
          "as3/robotlegs/mediator.as.tt"
        end

        def generate
         @view_package_name = @package_name.dup << ".components" unless @package_name == ""
         @view_class_name = @class_name.dup
         @package_name += ".mediators" unless @package_name == ""
         @class_name += "Mediator" unless @class_name.match(/Mediator$/)
         super
        end
        
        no_tasks {

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