defmodule Rocketdelivery.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias Rocketdelivery.ViaCep.Client

  describe "get_cep_info/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when there is a valid cep, returns the cep info", %{bypass: bypass} do
      cep = "14790000"

      url = endpoint_url(bypass.port)

      body = ~s({
        "cep": "14790-000",
        "logradouro": "",
        "complemento": "",
        "bairro": "",
        "localidade": "Guaíra",
        "uf": "SP",
        "ibge": "3517406",
        "gia": "3220",
        "ddd": "17",
        "siafi": "6449"
      })

      Bypass.expect(bypass, "GET", "#{cep}/json", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response = Client.get_cep_info(url, cep)

      expected_response =
        {:ok,
         %{
           "bairro" => "",
           "cep" => "14790-000",
           "complemento" => "",
           "ddd" => "17",
           "gia" => "3220",
           "ibge" => "3517406",
           "localidade" => "Guaíra",
           "logradouro" => "",
           "siafi" => "6449",
           "uf" => "SP"
         }}

      assert response == expected_response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
