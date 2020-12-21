defmodule BancoBs2.Entities.SacadorAvalista do
  @moduledoc """
    Struct representing SacadorAvalista. Usually
    part of a Boleto entity.
  """

  alias BancoBs2.Entities.Endreco

  defstruct tipo: nil,
            documento: nil,
            nome: nil,
            endreco: nil

  @typedoc """
    Type that represents SacadorAvalista with:

      tipo: integer,
      documento: String.t(),
      nome: String.t(),
      endreco: Endreco.t()
  """

  @type t :: %BancoBs2.Entities.SacadorAvalista{
          tipo: integer,
          documento: String.t(),
          nome: String.t(),
          endreco: Endreco.t()
        }
end
