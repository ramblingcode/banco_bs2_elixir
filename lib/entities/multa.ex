defmodule BancoBs2.Entities.Multa do
  @moduledoc """
    Struct representing Multa. Usually part
    of a Boleto entity.
  """

  defstruct valor: nil,
            data: nil,
            juros: nil

  @typedoc """
    Type that represents Multa with:

      valor: float(),
      data: String.t(),
      juros: float()
  """

  @type t :: %BancoBs2.Entities.Multa{
          valor: float(),
          data: String.t(),
          juros: float()
        }
end
