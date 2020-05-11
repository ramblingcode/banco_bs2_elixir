defmodule BancoBs2.Entities.Boleto do
  @moduledoc """
    Struct holding information for Boleto
    slips.
  """

  alias BancoBs2.Entities.Desconto
  alias BancoBs2.Entities.Mensagem
  alias BancoBs2.Entities.Multa
  alias BancoBs2.Entities.Sacado
  alias BancoBs2.Entities.SacadorAvalista

  defstruct id: nil,
            sacado: nil,
            status: nil,
            nosso_numero: nil,
            codigo_de_barra: nil,
            linha_digitavel: nil,
            seu_numero: nil,
            cliente_id: nil,
            sacador_avalista: nil,
            vencimento: nil,
            valor: nil,
            canal: nil,
            multa: nil,
            desconto: nil,
            mensagem: nil

  @typedoc """
    Type that represents `Boleto` struct with:

      id: String.t(),
      sacado: Sacado.t(),
      status: integer,
      nosso_numero: integer,
      codigo_de_barra: String.t(),
      linha_digitavel: String.t(),
      seu_numero: String.t(),
      cliente_id: String.t(),
      sacador_avalista: SacadorAvalista.t(),
      vencimento: String.t(),
      valor: integer,
      canal: String.t(),
      multa: Multa.t(),
      desconto: Desconto.t(),
      mensagem: Mensagem.t()
  """

  @type t :: %BancoBs2.Entities.Boleto{
          id: String.t(),
          sacado: Sacado.t(),
          status: integer,
          nosso_numero: integer,
          codigo_de_barra: String.t(),
          linha_digitavel: String.t(),
          seu_numero: String.t(),
          cliente_id: String.t(),
          sacador_avalista: SacadorAvalista.t(),
          vencimento: String.t(),
          valor: integer,
          canal: String.t(),
          multa: Multa.t(),
          desconto: Desconto.t(),
          mensagem: Mensagem.t()
        }
end
