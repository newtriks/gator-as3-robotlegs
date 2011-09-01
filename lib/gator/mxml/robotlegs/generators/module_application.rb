module Gator
  module MXML
    module RobotLegs
      class ModuleApplicationGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator
        include ActAsMXMLKlassGenerator

        define :command => "module_application",
               :usage => "generate RobotLegs mxml modular application CLASS_NAME", :description => "Creates RobotLegs mxml modular application."

        def template_file
          "mxml/module_application.mxml.tt"
        end
      end
    end
  end
end