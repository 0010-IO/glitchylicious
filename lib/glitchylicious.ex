defmodule Glitchylicious do
	@moduledoc """
  Produces magnificent glitches,
  by corrupting some jpg bytes.
  
  Pretty much stolen from: georg @ http://fishnation.de/

  Take a look at his js experiments, cool stuff!

  Example:

      alias Glitchylicious, as: G

      def glitch do
        G.glitch("./myimage.jpg", [iter: 10, amount: 50, seed: 10])
      end
  """

  @doc """
  Glitches jpg data.

  Takes an input path (original image), output path (path to save glitch to),
  as well as a config list. Returns corrupted binary data.
  
  Config list should include the following parameters:

      iter   - number of iterrations to perform.
      amount - corruption severety.
      seed   - seed value.
  """
  @spec glitch(String.t, list) :: binary
  def glitch(input, [iter: iter, amount: amount, seed: seed]) do
    raw = File.read!(input)
    h = header_size(raw)
    do_glitch(raw, h, iter, amount, seed)
  end

	defp header_size(raw), do: header_size(raw, 0)
	defp header_size(<< 255, 218, _data::binary >>, acc), do: acc + 2
	defp header_size(<< _a::8, b::8, data::binary >>, acc), do: header_size(<< b >> <> data, acc + 1)

  defp do_glitch(image, len, iter, amount, seed) do
    do_glitch(image, len, 0, iter, amount / 100, seed / 100)
  end
	defp do_glitch(image, _len, i, iter, _amount, _seed) when i == iter do
		image
	end
	defp do_glitch(image, len, i, iter, amount, seed) do
		max_index = byte_size(image) - len - 4
		px_min = round(max_index / iter * i)
		px_max = round(max_index / iter * (i + 1))
		delta = px_max - px_min
		px_i = round(px_min + delta * seed)
    
		byte_index = if px_i > max_index do
      len + max_index
    else
      len + px_i
    end
    
		<<a::binary-size(byte_index), _::8, rest::binary>> = image
    
		do_glitch(<< a :: binary, Float.floor(amount * 256) |> trunc, rest :: binary >>,
              len, i + 1,
              iter, amount, seed)
	end
end
