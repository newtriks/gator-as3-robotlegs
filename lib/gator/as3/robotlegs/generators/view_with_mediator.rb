module Gator
  module AS3
    module RobotLegs

      class ViewWithMediatorGenerator < Gator::Generator

        define :command => "view_with_mediator",
               :usage => "generate as3 rl view_with_mediator class CLASS_NAME", :description => "Creates RobotLegs View and Mediator classes."

        def generate
          invoke resolve_subcommand(["robotlegs","mediator"],["as3","klass"])
          invoke resolve_subcommand(["robotlegs","view"],["as3","klass"])
        end

      end

    end
  end
end