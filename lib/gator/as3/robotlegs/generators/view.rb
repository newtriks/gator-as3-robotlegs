module Gator
  module AS3
    module RobotLegs

      class ViewGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator

        define :command => "view",
               :usage => "generate as3 view CLASS_NAME", :description => "Creates AS3 View class."

        def template_file
          "as3/robotlegs/view.as.tt"
        end

        def generate
          @package_name += ".components" unless @package_name == ""
          super
        end

      end

    end
  end
end