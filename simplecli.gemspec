Gem::Specification.new do |s|
  s.name = "simplecli"
  s.version = "0.1.5"
  s.date = "2008-04-27"
  s.summary = "Super Simple RubyGems-like CLI"
  s.email = "remi@remitaylor.com"
  s.homepage = "http://github.com/remi/simplecli"
  s.description = "SimpleCLI gives you a stupidly simple way to implement command-line interfaces like that of RubyGems"
  s.has_rdoc = true
  s.rdoc_options = ["--quiet", "--title", "SimpleCLI - Simple RubyGems-like Command-line Interface", "--opname", "index.html", "--line-numbers", "--main", "README", "--inline-source"]
  s.extra_rdoc_files = ['README']
  s.authors = ["remi Taylor"]
  s.files = ["README","lib/simplecli.rb","examples/hello-cli"]
end
