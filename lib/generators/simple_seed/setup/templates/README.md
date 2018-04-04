# Simple Seeds

just seed files in ordered file names with any ruby logic

## usage:

just run rails seed command as this hooks into `db:seed`
```bash 
rails db:seed
```
or only run `rails db:simple_seed` to ignore simple seeds

```bash
rails db:simple_seed
```


## Examples:

file `db/simple-seeds/00001_users.rb`

```ruby
# Create 10 Users
if Rails.env.development?
  10.times
    User.create([
      {
        first_name: Faker::Name.first_name,     
        last_name:  Faker::Name.last_name),
        user_email: Faker::Internet.email
    }])
  end
end
```

file `db/simple-seeds/00002_users_posts.rb`


```ruby
# Create Random amount of posts per user
if Rails.env.development?
  users = User.all
  users.each do |user|
  Random.rand(11) + 1).times
    Post.create([
      {
        user_id: user.id,
        description: Faker::Loerm.paragraph 
      }])
    end
  end
end
```

