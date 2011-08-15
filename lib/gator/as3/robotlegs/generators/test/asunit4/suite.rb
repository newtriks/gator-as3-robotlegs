module Gator
  module AS3
    module RobotLegs
      module ASUnit4

        class SuiteGenerator < Task
          include Gator::Project

          define :command => "suite",
                 :usage => "generate as3 asunit4 test suite CLASS_NAME", :description => "Creates ASUnit4 suite."
          
          argument :classname
          
          def self.source_root
            File.dirname __FILE__
          end

          def generate
            src = project.path(:source, :test, :as3)
            @package_name = src.dup
            @class_name = "AllTests"
            template "suite.as.tt", File.join(src, "#{@class_name}.as")
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

        end
      end
    end
  end
end