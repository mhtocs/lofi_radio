import Config

config :lofi_radio, LofiRadio.Repo,
  database: "lofi_radio",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :lofi_radio, ecto_repos: [LofiRadio.Repo]
