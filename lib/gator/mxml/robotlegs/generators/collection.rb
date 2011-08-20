require File.dirname(__FILE__) + '/application'

module Gator
  module MXML
    module RobotLegs

      class GeneratorCollection < Gator::Command

        define :command => "robotlegs", :short => "rl",
               :usage => "generate RobotLegs mxml GENERATOR", :description => "RobotLegs generators for MXML."

        register_subcommand Gator::MXML::RobotLegs::ApplicationGenerator
      
      end
    end
  end
end