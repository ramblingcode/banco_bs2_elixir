import Config

config(
  :banco_bs2,
  :basic_auth,
  %{
    user: System.get_env("BS2_AUTH_USER"),
    pass: System.get_env("BS2_AUTH_PASS")
  }
)

config(
  :banco_bs2,
  :account,
  %{
    user: System.get_env("BS2_USER"),
    pass: System.get_env("BS2_PASS")
  }
)

import_config("#{Mix.env()}.exs")
