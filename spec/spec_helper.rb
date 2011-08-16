$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'thor'
require 'stringio'
require 'fileutils'
require 'gator'
require 'gator/as3/generators'
require File.dirname(__FILE__) + '/../lib/gator/as3/robotlegs/generators'
require File.dirname(__FILE__) + '/../lib/gator/as3/robotlegs/generators/test/asunit4'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f }

RSpec.configure do |config|
  include FileUtils
#Ref from https://github.com/andersjanmyr/thor-tasks/blob/master/gen.thor/templates/spec/spec_helper.rb
    def capture(*streams)
      streams.map! { |stream| stream.to_s }
      begin
        result = StringIO.new
        streams.each { |stream| eval "$#{stream} = result" }
        yield
      ensure
        streams.each { |stream| eval("$#{stream} = #{stream.upcase}") }
      end
      result.string
    end

    def sandbox
      File.join(File.dirname(__FILE__), 'sandbox')
    end

    def run(command)
      mkdir_p sandbox
      cp gator.rb sandbox
      cd(sandbox) do
        system("#{command}")
      end
    end

    def gator(args)
      gen=Gator::AS3::Task.new
      run("gator generate as3 robotlegs command #{args}")
    end

    def clean
      rm_rf sandbox
    end

    # Creates a file object from a filename.
    # If the filename is absolute, the file references the actual file.
    # If the filename is relative, a file is referenced to a sandboxed
    # file.
    def file(name)
      if name.start_with?('/')
        File.new(name)
      elsif name.start_with?('~')
        File.new(name.gsub('~', "#{ENV['HOME']}"))
      else
        File.new(File.join(sandbox, name))
      end
    end
  end

  module FileExt
    # Checks if a file exists.
    def exist?
      File.exist?(path)
    end

    # The contents of the file.
    def contents
      read
    end
  end

  class File
    include FileExt
  end
