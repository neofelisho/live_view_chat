defmodule LiveViewChatWeb.Router do
  use LiveViewChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveViewChatWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveViewChatWeb do
    pipe_through :browser

    live "/", PageLive, :index

    live "/users", UserLive.Index, :index
    live "/users/new", UserLive.Index, :new
    live "/users/:id/edit", UserLive.Index, :edit

    live "/users/:id", UserLive.Show, :show
    live "/users/:id/show/edit", UserLive.Show, :edit

    live "/chats", RoomLive.Index, :index
    live "/chats/new", RoomLive.Index, :new
    live "/chats/:id/edit", RoomLive.Index, :edit

    live "/chats/:id", RoomLive.Show, :show
    live "/chats/:id/show/edit", RoomLive.Show, :edit

    live "/messages", MessageLive.Index, :index
    live "/messages/new", MessageLive.Index, :new
    live "/messages/:id/edit", MessageLive.Index, :edit

    live "/messages/:id", MessageLive.Show, :show
    live "/messages/:id/show/edit", MessageLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveViewChatWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: LiveViewChatWeb.Telemetry
    end
  end
end
