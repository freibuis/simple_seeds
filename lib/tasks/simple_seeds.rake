namespace :db do
  desc 'runs seed code from simple_seed directory'
  task simple_seeds: :environment do
    if defined?(Rails)

      # All environments seed files
      all_seeds = Dir[File.join(
        Rails.root, 'db', 'simple_seeds',
        'environments', 'all', '**', '*.rb'
      )].collect do |file|
        {
          environment: :all,
          file:        file,
          filename:    File.basename(file)
        }
      end

      # Rails environment seed files
      environment_seeds = Dir[File.join(
        Rails.root, 'db', 'simple_seeds',
        'environments', Rails.env, '**', '*.rb'
      )].collect do |file|
        {
          environment: Rails.env.to_sym,
          file:        file,
          filename:    File.basename(file)
        }
      end

      # Sort the seed by filename
      #  This should make All env sort first. of course this would mean
      #  env: aaa would load first and break
      #
      #  Retweak this later if more env's come before evn: all
      seeds = (all_seeds + environment_seeds).sort_by do |seed_file|
        seed_file[:filename]
      end

      # Run simple_seeds configuration first
      # load all  configurations here
      # @max_users = 1
      # this will then use max_users as 1 in all loaded seeds
      seed_configuration_file = Rails.root.join(
        'db', 'simple_seeds', 'simple_seeds.rb'
      )
      load seed_configuration_file if File.exist?(seed_configuration_file)

      # Load each seed file. simple
      seeds.each do |seed_file|
        load seed_file[:file]
      end
    end
  end

  Rake::Task['seed'].enhance do
    Rake::Task[:simple_seeds].invoke
  end
end
