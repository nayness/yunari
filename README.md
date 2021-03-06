
## Welcome Stranger
Yunari is an app to create your favorites characters and share them with your friends!

It's baked with
* Ruby version
  2.7.4

* Rails version
  6.1.4

* System dependencies
  
  Node 16.3.0

* Configuration

  To run Yunari properly you'll need to 

  `bundle install`
 
  `yarn install`


* Create DB

  In config there's an `database.yml.example` for reference
  You'll need to have postgresql or you can switch to sqlite an use [this](https://gist.github.com/danopia/940155) file as reference

  `rails db:create`

* Next run migrations

  `rails db:migrate`

  And seed databse with default values
 
  `rails db:seed`

 ### Roles
 
 Name| Privileges
------------ | ----------
standard| can edit characters and personal info
admin | can also edit character races and kinds

To get access to all features please create an admin user (by default new users are created with standard privileges)

`User.find(1).add_role(:admin)`

## Endpoints

### Show character info (public)

`/api/v1/personajes/:slug`

### Create character

First, you must create an `.env` file in proyect's root directory 

`touch .env`

Create a rails secret

`rails secret`

And copy paste it into `.env` file as

`JWT_TOKEN = your_rails_secret`

##### Troubleshooting

If isn't loading correctly ENVs, please try stoping spring and restarting your rails server

`spring stop`

Next you'll need to create an api user

#### Create api user

`post /api_users/sign_up`

Example payload

    {
      "api_user": {
          "email": "lala@test.com",
          "password": "thiisneverthat",
          "password_confirmation: "thisisneverthat"
      }
    }

#### Login to get jwt token

`post /api_users/sign_in`

Example payload

    {
      "api_user": {
          "email": "lala@test.com",
          "password": "thiisneverthat"
      }
    }

Use bearer in headers response to create a character

![Postman](https://64.media.tumblr.com/abe5b7bc1f6b368a63cb7400f98ead71/606afcc712cb52df-2b/s1280x1920/de7370933cb05c28e5a7312982ab2b152d29d4c4.png)

#### Create character

`post /api/v1/personajes`

Example payload

    {
        "character": {
            "name": "Annie",
            "power": 300,
            "attack": 1000,
            "charisma": 1000,
            "strenght": 100,
            "spirit": 100,
            "history": "Fire Girl",
            "race_id": 1,
            "kind_id": 1

        }
    }


#### Extra: close session

`delete /api_users/sign_out`

Example payload

    {
      "api_user": {
          "email": "lala@test.com",
          "password": "thiisneverthat"
      }
    }



