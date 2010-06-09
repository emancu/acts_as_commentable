# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_commentable}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["eMancu"]
  s.autorequire = %q{acts_as_commentable acts_as_author_comment}
  s.date = %q{2010-06-03}
  s.description = %q{Plugin/gem that provides comment functionality.
                    Thanks to Cosmin Radoi, Jack Dempsey, Xelipe and Chris Eppstein who are the original developers of this plugin.}
  s.email = %q{emiliano.mancuso@grid.com}
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README.rdoc", "lib/acts_as_commentable.rb", "lib/acts_as_author_comment.rb", "lib/author_comment_methods.rb", "lib/comment_methods.rb", "lib/commentable_methods.rb", "lib/generators", "lib/generators/comment", "lib/generators/comment/comment_generator.rb", "lib/generators/comment/templates", "lib/generators/comment/templates/comment.rb", "lib/generators/comment/templates/create_comments.rb", "lib/generators/comment/USEGA", "tasks/acts_as_commentable_tasks.rake", "init.rb", "install.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/eMancu/acts_as_commentable}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Plugin/gem that provides comment functionality}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
  end
end
