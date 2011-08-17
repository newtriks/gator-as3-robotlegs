require File.dirname(__FILE__) + '/generators/generator'
require File.dirname(__FILE__) + '/generators/collection'

Gator::AS3::GeneratorCollection.register_subcommand Gator::AS3::RobotLegs::GeneratorCollection