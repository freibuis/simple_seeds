class SimpleSeed::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_simple_seed_directory

    copy_file  'README.md' ,File.join('db','simple_seeds','README.md')

  end

end
