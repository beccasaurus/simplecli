require 'rake'
require 'rake/rdoctask'

desc "Quickly [re]generate and view docs (uses allison if installed)"
task :docs do |t|
  puts 'generating documentation ...'
  system("rake --silent doc:recreate TEMPLATE=allison")
  puts 'opening firefox ...'
  system("firefox doc/index.html &")
  puts 'done.'
end

namespace :doc do
  desc "Generate documentation for the application. Set custom template with TEMPLATE=/path/to/rdoc/template.rb"
  Rake::RDocTask.new("create") do |rdoc|
    rdoc.rdoc_dir = 'doc'
    rdoc.main = 'README'
    rdoc.title    = "SimpleCLI - Simple RubyGems-like Command-line Interface"
    rdoc.options << '--line-numbers' << '--inline-source'
    rdoc.options << '--charset' << 'utf-8'
    rdoc.rdoc_files.include('README')
    rdoc.rdoc_files.include('app/**/*.rb')
    rdoc.rdoc_files.include('lib/**/*.rb')

    # rake doc:create TEMPLATE=allison for a shortcut to using the allison template
    if ENV['TEMPLATE']
      if ENV['TEMPLATE'] == 'allison'
        allison = `gem which allison | grep -v "Can't find " | grep -v "(checking gem"`.strip.sub(/\.rb$/,'')
        rdoc.template = allison unless allison.empty?
      else
        rdoc.template = ENV['TEMPLATE']
      end
    end
  end
end
