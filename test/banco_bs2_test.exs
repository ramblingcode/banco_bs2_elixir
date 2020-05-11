defmodule BancoBs2Test do
  use ExUnit.Case, async: false

  setup_all _context do
    %{
      success: %{
        client: %BancoBs2.Entities.Client{
          access_token: "valid_access_token",
          token_type: "Bearer",
          expires_in: 420,
          refresh_token: "valid_refresh_token",
          scope: "forintegration"
        },
        grant_type: "password",
        scope: "success",
        refresh_token: "refresh_token"
      },
      failure: %{
        error: %BancoBs2.ApiError{
          code: 401,
          name: "invalid_request",
          message: "The resource owner could not be authenticated."
        },
        grant_type: "password",
        refresh_token: "refresh_token",
        scope: "failure"
      }
    }
  end

  test "#authenticate returns %Client{} on success", context do
    res =
      BancoBs2.authenticate(
        context.success.grant_type,
        context.success.scope
      )

    assert res == {:ok, context.success.client}
  end

  test "#authenticate returns %ApiError{} on failure", context do
    res =
      BancoBs2.authenticate(
        context.failure.grant_type,
        context.failure.scope
      )

    assert res == {:error, context.failure.error}
  end

  test "#refresh returns %Client{} on success", context do
    res =
      BancoBs2.refresh(
        context.success.refresh_token,
        context.success.grant_type,
        context.success.scope
      )

    assert res == {:ok, context.success.client}
  end

  test "#refresh returns %ApiError{} on failure", context do
    res =
      BancoBs2.refresh(
        context.failure.refresh_token,
        context.failure.grant_type,
        context.failure.scope
      )

    assert res == {:error, context.failure.error}
  end
end
