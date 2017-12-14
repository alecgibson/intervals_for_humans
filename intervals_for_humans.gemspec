Gem::Specification.new do |s|
  s.name = "intervals_for_humans"
  s.version = "0.1.0"
  s.date = "2017-12-14"
  s.summary = "Intervals for humans"
  s.description = "A gem for parsing date intervals into human-readable text"
  s.authors = ["Alec Gibson"]
  s.email = "aleckgibson@gmail.com"
  s.files = ["lib/intervals_for_humans.rb", "lib/intervals_for_humans/interval.rb"]
  s.homepage = "http://rubygems.org/gems/intervals_for_humans"
  s.license = "MIT"

  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "rspec", "~> 3.7"
  s.add_development_dependency "pry", "~> 0.11"
end
