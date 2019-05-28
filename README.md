# Elements

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Notes

How are modules included?
> For the stuff in lib, everything ending with .ex is compiled to .beam files
> when you run mix compile.

Where are our files?
* under lib/

How does mix.compile work?
  https://hexdocs.pm/mix/Mix.Tasks.Compile.html
  looks to be called by another part of the process, nothing specific about
  paths

  mix.exs has `elixirc_paths`, which poins to lib/.

  What is this?
    https://hexdocs.pm/mix/Mix.Tasks.Compile.Elixir.html
    mix.compile can compile to a bunch of things.  elixirc_paths is an option
    when compiling to Elixir that specifies where source files are.  Putting
    this altogether, this uses mix.compile to compile to Elixir, which reads
    from the project.elixirc_paths in mix.exs, which specifies source paths,
    which are all compiled, so the names are available in any of the modules.

What about module naming conflicts?
  Looks like they'll clobber each other.

How do we run unit tests for single modules?
  https://stackoverflow.com/a/21888877/1319850

  > mix test path/to/test.exs:123

I can't run the test without including ElementsWeb.ConnCase, which is only for
async/db connection tests.  What am I missing?
  use ExUnit.Case

Is there a watch mode?
  Not natively.  https://github.com/lpil/mix-test.watch

How do install deps?
  mix deps.get

  Now I can run and watch with
    mix test.watch test/elements_web/elements_test.exs
