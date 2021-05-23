defmodule Rockelivery.ViaCep.Client do
  use Tesla
  alias Rockelivery.Error
  alias Tesla.Env

  @behaviour Rockelivery.ViaCep.Behaviour

  # plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"
  @base_url "https://viacep.com.br/ws/"

  plug Tesla.Middleware.JSON

  def get_cep_info(url \\ @base_url, cep) do
    "#{url}#{cep}/json/"
    |> get()
    |> handle_get()
  end

  def get_client do
    :rockelivery
    |> Application.fetch_env!(Rockelivery.ViaCep)
    |> Keyword.get(:via_cep_adapter)
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"error" => true}}}) do
    {:error, Error.build(:not_found, "CEP not found")}
  end

  defp handle_get({:ok, %Env{status: 400, body: _body}}) do
    {:error, Error.build(:bad_request, "invalid CEP")}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end
end
