require File.dirname(__FILE__) + '/command'
require File.dirname(__FILE__) + '/mediator'

module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class TestGeneratorCollection < Gator::Command

          define :command => "test",
                 :usage => "generate as3 robotlegs test GENERATOR", :description => "TestGenerators for robotlegs with ASUnit4"

          register_subcommand CommandTestGenerator
          register_subcommand MediatorTestGenerator

        end
      end
    end
  end
end