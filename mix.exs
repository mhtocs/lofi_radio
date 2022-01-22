defmodule LofiRadio.MixProject do
  use Mix.Project

  def project do
    [
      app: :lofi_radio,
      version: "1.0.0",
      deps: deps()
    ]
  end

  defp deps() do
    [
      {:ecto_sql, "~> 3.7"},
      {:postgrex, "~> 0.15.10"}
    ]
  end

  def application do
    [mod: {LofiRadio.Application, []}]
  end
end
