defmodule Sobelow.SQL.Stream do
  @moduledoc """
  # SQL Injection in Stream

  This submodule of the `SQL` module checks for SQL injection
  vulnerabilities through usage of the `Ecto.Adapters.SQL.stream`.

  Ensure that the query is parameterized and not user-controlled.

  SQLi Stream checks can be ignored with the following command:

      $ mix sobelow -i SQL.Stream
  """
  @uid 18
  @finding_type "SQL.Stream: SQL injection"

  use Sobelow.Finding

  def run(fun, meta_file) do
    confidence = if !meta_file.is_controller?, do: :low

    Finding.init(@finding_type, meta_file.filename, confidence)
    |> Finding.multi_from_def(fun, parse_sql_def(fun))
    |> Enum.each(&Print.add_finding(&1))
  end

  ## stream(repo, sql, params \\ [], opts \\ [])
  def parse_sql_def(fun) do
    Parse.get_fun_vars_and_meta(fun, 1, :stream, {:required, :SQL})
  end
end
