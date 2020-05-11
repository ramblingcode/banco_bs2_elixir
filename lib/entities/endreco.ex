defmodule BancoBs2.Entities.Endreco do
  @moduledoc """
    Entity representing Endreco.
  """

  defstruct cep: nil,
            estado: nil,
            cidade: nil,
            bairro: nil,
            logradouro: nil,
            numero: nil,
            complemento: nil

  @typedoc """
    Type that represents `Endreco` with:

      cep: String.t(),
      estado: String.t(),
      cidade: String.t(),
      bairro: String.t(),
      logradouro: String.t(),
      numero: String.t(),
      complemento: String.t()
  """

  @type t :: %BancoBs2.Entities.Endreco{
          cep: String.t(),
          estado: String.t(),
          cidade: String.t(),
          bairro: String.t(),
          logradouro: String.t(),
          numero: String.t(),
          complemento: String.t()
        }
end
