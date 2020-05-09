defmodule BancoBs2.ApiError do
  @moduledoc """
    ApiError struct; holding information
    for error status code, name and message.
  """

  defstruct code: nil, name: nil, message: nil

  @typedoc """
    Type that represent ApiError with:

      - code: Integer representing http status code

      - name: String representing error name

      - message: String representing error message/description
  """

  @type t :: %BancoBs2.ApiError{
          code: integer,
          name: String.t(),
          message: String.t()
        }
end
