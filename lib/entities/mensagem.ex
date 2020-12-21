defmodule BancoBs2.Entities.Mensagem do
  @moduledoc """
    Struct representing Mensagem. Usually part
    of a Boleto entity.
  """

  defstruct linha1: nil,
            linha2: nil,
            linha3: nil,
            linha4: nil

  @typedoc """
    Type that represents Desconto with:

      linha1: String.t(),
      linha2: String.t(),
      linha3: String.t(),
      linha4: String.t()
  """

  @type t :: %BancoBs2.Entities.Mensagem{
          linha1: String.t(),
          linha2: String.t(),
          linha3: String.t(),
          linha4: String.t()
        }
end
