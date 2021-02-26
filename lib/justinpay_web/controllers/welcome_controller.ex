defmodule JustinpayWeb.WelcomeController do
  use JustinpayWeb, :controller

  alias Justinpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "result is #{result}"})
  end

  defp handle_response({:error, err}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: err})
  end
end
