# README
## Dependencies
* Ruby 2.7.2
* Rails 6.1.2.1
* Postgresql

## Configuration
After cloning the project and installing the dependencies, depending on how your postgres is installed `config/database.yml` may need modification. The supplied `database.yml` works for postgres installs that do not require username/password (like postgres.app or homebrew).

* run `bundle install`
* run `bin/rails db:create`
* run `bin/rails db:schema:load`
* run `bin/rails db:seed`
* run `bin/rails s` to run the server

## Usage
There are 2 endpoints. One for creating messages and one for getting messages. Assuming the server is running on `localhost:3000`:

### Create message
Here is a sample curl command with all the required params:
```
curl --request POST \
  --url http://localhost:3000/messages.json \
  --header 'Content-Type: application/json' \
  --data '{
  "message": {
    "sender": "alice",
    "receiver": "bob",
    "content": "hello"
  }
}'
```

returns:
```
{"sender":"alice","receiver":"bob","content":"hello","created_at":"..."}
```

If required params are missing:
```
curl --request POST \
  --url http://localhost:3000/messages.json \
  --header 'Content-Type: application/json' \
  --data '{
  "message": {
    "sender": "b"
  }
}'
```

returns:
```
{"receiver":["can't be blank"],"content":["can't be blank"]}
```

### Get messages
Here is a sample curl command with all the required params:
```
curl --request GET \
  --url 'http://localhost:3000/messages.json?receiver=bob'
```

returns:
```
[
  {
    "sender": "alice",
    "receiver": "bob",
    "content": "hello",
    "created_at": "..."
  },
  ...
]
```

If required params are missing:
```
curl --request GET \
  --url 'http://localhost:3000/messages.json?sender=alice'
```

returns:
```
{"receiver":"can't be blank"}
```

#### Optional params
The `sender` param can be specified to get messages from a specific sender.
```
curl --request GET \
  --url 'http://localhost:3000/messages.json?receiver=bob&sender=alice'
```

The `last_30` param can be set to `t` to fetch all messages within the last 30 days. By default, the last 100 messages to the receiver are fetched.
```
curl --request GET \
  --url 'http://localhost:3000/messages.json?receiver=bob&last_30=t'

curl --request GET \
  --url 'http://localhost:3000/messages.json?receiver=bob&sender=alice&last_30=t'
```

## Tests
The test suit can be found in the `test/` directory and can be run with `bin/rails test`
