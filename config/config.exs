# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :j_study_blog,
  ecto_repos: [JStudyBlog.Repo]

# Configures the endpoint
config :j_study_blog, JStudyBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m1gWR+51jfIjAAHEEC/K8mnabAaEJbTL844tb7sRwps7xCn/J3QeP5ih4izc172M",
  render_errors: [view: JStudyBlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JStudyBlog.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "bqF6Ak0Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
