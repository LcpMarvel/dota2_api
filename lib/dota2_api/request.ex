defmodule Dota2API.Request do
  @type params :: [{atom, any}]

  alias HTTPoison.Response

  @spec load(String.t, params) :: map | no_return
  def load(url, params) do
    dota2_api_key =
      case Keyword.get(params, :key) do
        nil -> Dota2API.ApiKey.get
        key -> key
      end

    options = [
      ssl: [{:versions, [:'tlsv1.2']}],
      params: [key: dota2_api_key] ++ params
    ]

    {:ok, %Response{status_code: status, body: body}} = HTTPoison.get(url, [], options)

    case status do
      200 ->
        Poison.decode!(body)
      403 ->
        raise "Forbidden, You have to set dota2 API key."
      429 ->
        raise Dota2API.TooManyRequestsError, [url: url, params: params]
    end
  end
end
