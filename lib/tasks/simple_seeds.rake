namespace :db do
  desc 'runs seed code from simple_seed directory'
  task simple_seeds: :environment do
    if defined?(Rails)
      Dir[File.join(Rails.root, 'db', 'simple_seeds', '**', '*.rb')].each do |file|
        load file
      end
    end
  end

  Rake::Task['seed'].enhance do
    Rake::Task[:simple_seeds].invoke
  end
end