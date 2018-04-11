# Simple Seeds Rails Tasks
class SimpleSeeds::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/simple_seed.rake'
  end
end
