defmodule JustinpayWeb.AccountsControllerTest do
  use JustinpayWeb.ConnCase, async: true

  alias Justinpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Justino",
        password: "12345",
        nickname: "justino",
        email: "a@a.com",
        age: 5
      }

      {:ok, %User{account: %Account{id: account_id}}} = Justinpay.create_user(params)
      conn = put_req_header(conn, "authorization", "Basic #{Base.encode64("banana:nanica")}")
      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make a deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => 50}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id}, "message" => "Balance changed"
      } = response
    end

    test "when there are invalid params, return an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected = %{ "message" => "Invalid value" }
      assert expected == response
    end
  end
end
