defmodule Sobelow.XSS.HTML do
  @moduledoc """
  # XSS in `html`

  This submodule looks for XSS vulnerabilities in `html`
  calls from the Phoenix Controller.

  HTML checks can be ignored with the following command:

      $ mix sobelow -i XSS.HTML
  """
  @uid 29
  @finding_type "XSS.HTML: XSS in `html`"

  use Sobelow.Finding

  def run(fun, meta_file) do
    confidence = if !meta_file.is_controller?, do: :low

    Finding.init(@finding_type, meta_file.filename, confidence)
    |> Finding.multi_from_def(fun, parse_def(fun))
    |> Enum.each(&Print.add_finding(&1))
  end

  def parse_def(fun) do
    Parse.get_fun_vars_and_meta(fun, 1, :html, :Controller)
  end
end
