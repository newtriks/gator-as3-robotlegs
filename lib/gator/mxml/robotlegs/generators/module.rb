module Gator
  module MXML
    module RobotLegs
      class ModuleGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator
        include ActAsMXMLKlassGenerator

        define :command => "module",
               :usage => "generate RobotLegs mxml module CLASS_NAME", :description => "Creates RobotLegs mxml module."

        def template_file
          "mxml/module.mxml.tt"
        end
      end
    end
  end
end