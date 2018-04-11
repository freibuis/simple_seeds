# Simple Seeds Rails Tasks
class SimpleSeeds::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/simple_seeds.rake'
  end
end
