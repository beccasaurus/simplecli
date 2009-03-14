# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simplecli}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["remi"]
  s.date = %q{2009-03-14}
  s.description = %q{SimpleCLI gives you a stupidly simple way to implement command-line interfaces like that of RubyGems}
  s.email = %q{remi@remitaylor.com}
  s.files = ["Rakefile", "VERSION.yml", "README.rdoc", "LICENSE", "lib/simplecli.rb", "examples/hello-cli"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/remi/simplecli}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{For making simple RubyGem-like command-line interfaces}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
