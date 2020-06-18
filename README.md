# LiveViewChat

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Initialize the Phoenix LiveView Project

```shell script
$ mix phx.new live_view_chat --live
* creating live_view_chat/config/config.exs
...
You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

## Initialize the Postgres Database

```shell script
$ docker-compose up -d
Creating network "live_view_chat_default" with the default driver
Creating live_view_chat_postgres_1 ... done
```

## Generate the Boilerplate Codes

Context of Users:

```shell script
$ mix phx.gen.live Users User users name:string password_hash:string
```

Context of Chats:

```shell script
$ mix phx.gen.live Chats Room rooms name:string
* creating lib/live_view_chat_web/live/room_live/show.ex
...
```

```shell script
mix phx.gen.live Chats Message messages chat_id:references:chats user_id:references:users content:string
You are generating into an existing context.
...
```

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
