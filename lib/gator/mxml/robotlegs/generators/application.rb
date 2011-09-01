module Gator
  module MXML
    module RobotLegs
      class ApplicationGenerator < Gator::AS3::KlassGenerator
        include Gator::Project
        include WithRobotLegsTemplates
        include ActAsRobotLegsKlassGenerator
        include ActAsMXMLKlassGenerator

        define :command => "application", :short => "app",
               :usage => "generate RobotLegs mxml application CLASS_NAME", :description => "Creates RobotLegs mxml application."

        def template_file
          "mxml/application.mxml.tt"
        end
      end
    end
  end
end