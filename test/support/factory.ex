defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "address" => " Rua marieta luppo rabello",
      "age" => 26,
      "cep" => "04940130",
      "cpf" => "36342709858",
      "email" => "jazoniel@gmail.com",
      "name" => "jasoniel santana",
      "password" => "123456"
    }
  end

  def user_factory do
    %User{
      address: " Rua marieta luppo rabello",
      age: 26,
      cep: "04940130",
      cpf: "36342709858",
      email: "jazoniel@gmail.com",
      name: "jasoniel santana",
      password: "123456",
      id: "30b6b738-c26b-429c-a873-f6ffea41ea4c"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
