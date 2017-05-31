defmodule Utils.Request do
  @type params :: [{atom, any}]

  alias HTTPoison.Response

  @spec load(String.t, params) :: map | no_return
  def load(url, params) do
    options = [
      params: [key: Application.fetch_env!(:dota2_api, :key)] ++ params
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
