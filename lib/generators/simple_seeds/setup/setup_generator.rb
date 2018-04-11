
# Generators for Simple Seeds
class SimpleSeeds::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def environments
    ['all'] + Dir[File.join(Rails.root, 'config', 'environments', '*.rb')]
              .collect { |f| File.basename(f, '.rb') }
  end

  # Create simple seeds confuration file
  def create_configuration_file
    template 'simple_seeds.rb', File.join(
      'db', 'simple_seeds', 'simple_seeds.rb'
    )
  end

  # Creates simple Seeds base file
  def create_simple_seed_directory
    @environments = environments
    template 'README.md', File.join('db', 'simple_seeds', 'README.md')
  end

  # Creates all enviroments based of this rails project
  def create_simple_seed_environment_directory
    environments.each do |environment|
      @environment = environment
      template('environment.README.md',
               File.join('db', 'simple_seeds',
                         'environments', environment, 'README.md'))
    end
  end
end
