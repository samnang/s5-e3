# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bstree/version"

Gem::Specification.new do |s|
  s.name        = "bstree"
  s.version     = BSTree::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Samnang Chhun"]
  s.email       = ["samnang.chhun@gmail.com"]
  s.homepage    = "http://wowkhmer.com"
  s.summary     = %q{Binary Search Tree}
  s.description = %q{The simple Binary Search Tree.}

  s.rubyforge_project = "bstree"

  s.add_development_dependency("rspec", ">= 2.5.0")
  s.add_development_dependency("bundler", ">= 1.0.0")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
