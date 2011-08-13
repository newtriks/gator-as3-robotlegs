require File.dirname(__FILE__) + '/command'

module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class TestGeneratorCollection < Gator::Command

          define :command => "test",
                 :usage => "generate as3 robotlegs test GENERATOR", :description => "TestGenerators for robotlegs with ASUnit4"

          register_subcommand CommandTestGenerator

        end
      end
    end
  end
end