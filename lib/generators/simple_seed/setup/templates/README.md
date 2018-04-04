# Simple Seeds

Seed files in ordered file names with any ruby logic

## usage:

just run rails seed command as this hooks into `db:seed`
```bash 
rails db:seed
```
or only run `rails db:simple_seed` to ignore simple seeds

```bash
rails db:simple_seed
```
### environments
<% environments.each do |environment| %>
[<%= environment %>](environments/<%= environment %>)
<% end %>
#### Order of precedance

Simple seeds loads seeds based on the [all/] environment and the current selected environment


this can be handy if you require the same seed to run over all environments

#### Example:
assuming :development environment  
file1: `db/simple_seeds/environments/all/0001_users.rb`  
file2: `db/simple_seeds/environments/development/0002_users.rb`  
file3: `db/simple_seeds/environments/all/0003_posts.rb`  
file4: `db/simple_seeds/environments/development/0004_posts.rb`  

order => file1, file2, file3, file4

if an identical filename is found, then the :all environment will run first