defmodule BancoBs2.Entities.Client do
  @moduledoc """
    Struct holding `OAuth` information.

    Filled after successful authentication.
    To be used in further API requests.
  """

  defstruct access_token: nil,
            token_type: nil,
            expires_in: nil,
            refresh_token: nil,
            scope: nil

  @typedoc """
    Type that represents `Client` struct with:

      access_token: String.t(),
      token_type: String.t(),
      expires_in: integer,
      refresh_token: String.t(),
      scope: String.t()
  """

  @type t :: %BancoBs2.Entities.Client{
          access_token: String.t(),
          token_type: String.t(),
          expires_in: integer,
          refresh_token: String.t(),
          scope: String.t()
        }
end
