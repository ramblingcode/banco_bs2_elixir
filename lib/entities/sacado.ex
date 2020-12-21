defmodule BancoBs2.Entities.Sacado do
  @moduledoc """
    Struct representing Sacado. Usually part
    of a Boleto entity.
  """

  alias BancoBs2.Entities.Endreco

  defstruct email: nil,
            telefone: nil,
            tipo: nil,
            documento: nil,
            nome: nil,
            endreco: nil

  @typedoc """
    Type that represents `Sacado` with:
      email: String.t(),
      telefone: String.t(),
      tipo: integer,
      documento: String.t(),
      nome: String.t(),
      endreco: Endreco.t()
  """

  @type t :: %BancoBs2.Entities.Sacado{
          email: String.t(),
          telefone: String.t(),
          tipo: integer,
          documento: String.t(),
          nome: String.t(),
          endreco: Endreco.t()
        }
end
