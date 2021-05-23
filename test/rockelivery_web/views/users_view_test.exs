defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user, token: nil)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: " Rua marieta luppo rabello",
               age: 26,
               cep: "04940130",
               cpf: "36342709858",
               email: "jazoniel@gmail.com",
               id: "30b6b738-c26b-429c-a873-f6ffea41ea4c",
               inserted_at: nil,
               name: "jasoniel santana",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             },
             token: _token
           } = response
  end
end
