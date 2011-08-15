module Gator
  module AS3
    module RobotLegs

      class ViewWithMediatorGenerator < Task
        include Gator::Project

        define :command => "view_with_mediator",
               :usage => "generate as3 rl view_with_mediator class CLASS_NAME", :description => "Creates RobotLegs View and Mediator classes."

        argument :classname

        class_option :test, :default => false

        def generate
          invoke resolve_subcommand(["robotlegs","mediator"],["as3","klass"]), [classname]
          invoke resolve_subcommand(["robotlegs","view"],["as3","klass"]), [classname]
        end

      end

    end
  end
end