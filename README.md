# RussianDocs

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `russian_docs` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:russian_docs, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/russian_docs](https://hexdocs.pm/russian_docs).

## Usage

### Снилс
```elixir
# Valid number
RussianDocs.Snils.validate("96311715808")
{:ok, nil}

# Invalid number
RussianDocs.Snils.validate("96311715807")
{:error, :invalid_control_digit}
```
