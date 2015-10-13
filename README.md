###### glitchylicious

![CatGlitch](/glitch.jpg?raw=true)

Corrupting and glitching jpg files.  
Implementation of [georg's original algorithm](https://github.com/snorpey/glitch-canvas) in Elixir.

###### install

```elixir
defp deps do
  [{:glitchylicious, "~> 0.0.1"}]
end
```

###### usage

```elixir
defmodule MyGlitch do
  alias Glitchylicious, as: G
  
  def glitch do
    G.glitch("./image_to_glitch.jpg", %{iter: 14, amount: 20, seed: 34})
  end
end
```