require File.dirname(__FILE__) + '/robotlegs/context'
require File.dirname(__FILE__) + '/robotlegs/command'
require File.dirname(__FILE__) + '/robotlegs/model'
require File.dirname(__FILE__) + '/robotlegs/service'
require File.dirname(__FILE__) + '/robotlegs/mediator'
require File.dirname(__FILE__) + '/robotlegs/view_with_mediator'

module Gator
  module AS3
    module RobotLegs

      class RobotLegsGeneratorCollection < Gator::Command

        define :command => "robotlegs", :short => "rl",
               :usage => "generate as3 robotlegs GENERATOR", :description => "Generators for RobotLegs"
               
        register_subcommand ContextGenerator
        register_subcommand CommandGenerator
        register_subcommand ModelGenerator 
        register_subcommand ServiceGenerator 
        register_subcommand MediatorGenerator
        register_subcommand ViewWithMediatorGenerator
        
      end
    end
  end
end