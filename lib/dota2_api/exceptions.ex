defmodule Dota2API.TooManyRequestsError do
  defexception [:url, :params, :message]

  def exception(opts) do
    url = Keyword.fetch!(opts, :url)
    params = Keyword.fetch!(opts, :params)

    %__MODULE__{
      message: "Too Many Request",
      url: url,
      params: params
    }
  end
end
