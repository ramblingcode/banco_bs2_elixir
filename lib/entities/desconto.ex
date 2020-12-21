defmodule BancoBs2.Entities.Desconto do
  @moduledoc """
    Struct representing Desconto. Usually part
    of a Boleto entity.
  """

  defstruct percentual: nil,
            valorFixo: nil,
            valorDiario: nil,
            limite: nil

  @typedoc """
    Type that represents Desconto with:

      percentual: float(),
      valorFixo: float(),
      valorDiario: float(),
      limite: String.t()
  """

  @type t :: %BancoBs2.Entities.Desconto{
          percentual: float(),
          valorFixo: float(),
          valorDiario: float(),
          limite: String.t()
        }
end
