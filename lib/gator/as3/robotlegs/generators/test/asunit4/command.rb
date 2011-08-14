module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class CommandTestGenerator < Task
          include Gator::Project

          define :command => "command",
                 :usage => "generate as3 robotlegs test command CLASS_NAME", :description => "Creates ASUnit4 command test."

          argument :classname

          class_option :impl, :default => false

          def self.source_root
            File.dirname __FILE__
          end

          def generate
            src = project.path(:source, :test, :as3)
            @package_name, @class_name = split_class_name(classname)
            @class_name += "Test"
            src = File.join(src, @package_name.split(".").join(File::SEPARATOR)) unless @package_name == ""
            template "command.as.tt", File.join(src, "#{@class_name}.as")
          end

          def generate_implementation
            return unless options[:impl]
            invoke parent.parent.get_subcommand("command")
          end

          no_tasks {

            def package_name
              @package_name
            end

            def class_name
              @class_name
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