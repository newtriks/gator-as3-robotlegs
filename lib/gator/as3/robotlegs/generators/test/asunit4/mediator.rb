module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class MediatorTestGenerator < Task
          include Gator::Project

          define :command => "mediator",
                 :usage => "generate as3 robotlegs test mediator CLASS_NAME", :description => "Creates ASUnit4 mediator test."

          argument :classname

          class_option :impl, :default => false

          def self.source_root
            File.dirname __FILE__
          end

          def generate
            src = project.path(:source, :test, :as3)
            @package_name, @class_name = split_class_name(classname)
            @view_package_name = @package_name.dup << ".components"
            @view_class_name = @class_name.dup
            @class_name += "MediatorTest"
            @package_name += ".mediators"
            src = File.join(src, @package_name.split(".").join(File::SEPARATOR)) unless @package_name == ""
            template "mediator.as.tt", File.join(src, "#{@class_name}.as")
          end

          def generate_implementation
            return unless options[:impl]
            invoke resolve_subcommand(["robotlegs","mediator"],["as3","klass"])
          end

          no_tasks {

            def package_name
              @package_name
            end

            def class_name
              @class_name
            end
            
            def instance_name
              @class_name.chomp("Test")
            end
            
            def view_package_name
              @view_package_name
            end

            def view_class_name
              @view_class_name
            end

          }

          protected

          def split_class_name(class_name)
            pieces = class_name.split "."
            class_name = pieces.pop
            package_name = pieces.join "."
            return package_name, class_name
          end

        end
      end
    end
  end
end