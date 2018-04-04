# <%= @environment %> environment

## Examples:

file `db/simple-seeds/<%= @environment %>/00001_users.rb`

```ruby
# Create 10 Users
if Rails.env.<%= @environment %>?
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

file `db/simple-seeds/<%= @environment %>/00002_users_posts.rb`


```ruby
# Create Random amount of posts per user
if Rails.env.<%= @environment %>?
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

