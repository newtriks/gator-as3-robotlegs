module Gator
  module AS3
    module RobotLegs
      
      class ViewWithMediatorGenerator < Task
              include Gator::Project
              
              define :command => "view_with_mediator",
                     :usage => "generate as3 rl view and mediator class CLASS_NAME", :description => "Creates RobotLegs View and Mediator classes."

                      argument :classname

                      class_option :impl, :default => false

                      def self.source_root
                        File.dirname __FILE__
                      end

                      def generate_mediator
                        src = project.path(:source, :main, :as3)
                        @package_name, @class_name = split_class_name(classname)
                        @view_class_name = @class_name.dup
                        @view_package_name = @package_name.dup << ".components"
                        @class_name += "Mediator"
                        @package_name += ".mediators"
                        src = File.join(src, @package_name.split(".").join(File::SEPARATOR)) unless @package_name == ""
                        template "view_with_mediator.as.tt", File.join(src, "#{@class_name}.as")
                      end
                      
                      def generate_view
                        src = project.path(:source, :main, :as3)
                        @package_name, @class_name = split_class_name(classname)
                        @view_package_name = @package_name.dup << ".components"
                        src = File.join(src, @view_package_name.split(".").join(File::SEPARATOR)) unless @view_package_name == ""
                        template "view.as.tt", File.join(src, "#{@class_name}.as")
                      end

                      def generate_implementation
                        return unless options[:impl]
                        invoke parent.parent.get_subcommand("test", "mediator")
                      end

                      no_tasks {

                        def package_name
                          @package_name
                        end
                        
                         def view_package_name
                            @view_package_name
                          end

                        def class_name
                          @class_name
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