require "gator/as3/generators" 
require "gator/as3/generators/test/asunit4"
require "/Users/newtriks/Development/libs/gator-as3-robotlegs/lib/gator/as3/robotlegs/generators"
require "/Users/newtriks/Development/libs/gator-as3-robotlegs/lib/gator/as3/robotlegs/generators/test/asunit4"

project Gator::Project::ProjectBase.new
project.name = "MyProject"
project.options[:authors] = ["newtriks"]
project.layout[:source,:main,:as3] = "src"
project.layout[:source,:test,:as3] = "test"