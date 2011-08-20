require File.dirname(__FILE__) + '/application'
require File.dirname(__FILE__) + '/module'
require File.dirname(__FILE__) + '/module_application'

module Gator
  module MXML
    module RobotLegs

      class GeneratorCollection < Gator::Command

        define :command => "robotlegs", :short => "rl",
               :usage => "generate RobotLegs mxml GENERATOR", :description => "RobotLegs generators for MXML."

        register_subcommand Gator::MXML::RobotLegs::ApplicationGenerator
        register_subcommand Gator::MXML::RobotLegs::ModuleGenerator
        register_subcommand Gator::MXML::RobotLegs::ModuleApplicationGenerator
        
      end
    end
  end
end