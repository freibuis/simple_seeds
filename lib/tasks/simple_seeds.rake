namespace :db do
  desc 'runs seed code from simple_seed directory'
  task simple_seeds: :environment do
    if defined?(Rails)

      # All environments seed files
      all_seeds = Dir[File.join(
        Rails.root, 'db', 'simple_seeds',
        'environments', 'all', '**', '*.rb'
      )].collect { |file| { environment: :all, file: file } }

      # Rails environment seed files
      environment_seeds = Dir[File.join(
        Rails.root, 'db', 'simple_seeds',
        'environments', Rails.environment, '**', '*.rb'
      )].collect do |file|
        { environment: Rails.environment.to_sym, file: file }
      end

      # Sort the seed by filename
      #  This should make All env sort first. of course this would mean 
      #  env: aaa would load first and break
      #
      #  Retweak this later if more env's come before evn: all
      seeds = (all_seeds + environment_seeds).sort_by do |seed_file|
        seed_file[:file]
      end

      # Run simple_seeds configuration first
      # load all  configurations here
      # @max_users = 1
      # this will then use max_users as 1 in all loaded seeds
      load Rails.root.join('db', simple_seeds, 'simple_seeds.rb')

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
