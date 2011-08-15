require File.dirname(__FILE__) + '/context'
require File.dirname(__FILE__) + '/command'
require File.dirname(__FILE__) + '/model'
require File.dirname(__FILE__) + '/service'
require File.dirname(__FILE__) + '/mediator'
require File.dirname(__FILE__) + '/view'
require File.dirname(__FILE__) + '/view_with_mediator'

module Gator
  module AS3
    module RobotLegs

      class GeneratorCollection < Gator::Command

        define :command => "robotlegs", :short => "rl",
               :usage => "generate as3 robotlegs GENERATOR", :description => "Generators for RobotLegs"

        register_subcommand ContextGenerator
        register_subcommand CommandGenerator
        register_subcommand ModelGenerator
        register_subcommand ServiceGenerator
        register_subcommand MediatorGenerator
        register_subcommand ViewGenerator
        register_subcommand ViewWithMediatorGenerator

      end
    end
  end
end