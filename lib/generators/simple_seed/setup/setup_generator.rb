class SimpleSeed::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def environments

    environments = ['all']
    environments += Dir[File.join(Rails.root,'config','environments','*.rb')].collect {|f|  File.basename(f,'.rb') }

  end

  
  def create_simple_seed_directory

    @environments = environments
    template 'README.md' ,File.join('db','simple_seeds','README.md' ) 

  end
  
  def create_simple_seed_environment_directory

    environments.each do |environment|
      @environment = environment
      template( 'environment.README.md', File.join('db','simple_seeds','environments',environment,'README.md' ) )
    end
  
  end

end
