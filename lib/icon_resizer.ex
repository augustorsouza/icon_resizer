defmodule IconResizer do
  import Mogrify

  @sizes [
    %{output_dir_name: "iphone", size: 29},
    %{output_dir_name: "iphone", size: 57},
    %{output_dir_name: "iphone", size: 58},
    %{output_dir_name: "iphone", size: 80},
    %{output_dir_name: "iphone", size: 87},
    %{output_dir_name: "iphone", size: 114},
    %{output_dir_name: "iphone", size: 120},
    %{output_dir_name: "iphone", size: 180},
    %{output_dir_name: "watch", size: 48},
    %{output_dir_name: "watch", size: 55},
    %{output_dir_name: "watch", size: 58},
    %{output_dir_name: "watch", size: 80},
    %{output_dir_name: "watch", size: 87},
    %{output_dir_name: "watch", size: 88},
    %{output_dir_name: "watch", size: 172},
    %{output_dir_name: "watch", size: 196},
  ]

  @tab_sizes [
      %{output_dir_name: "tab", size: 25, scale: "@1x"},
      %{output_dir_name: "tab", size: 50, scale: "@2x"},
      %{output_dir_name: "tab", size: 75, scale: "@3x"},
  ]
	


  defp resize_icon_file(icon) do
    icon_file = Path.expand(icon)

    for %{output_dir_name: output_dir_name, size: size} <- @sizes do
      output_dir = [Path.dirname(icon_file), output_dir_name] |> Path.join

      output_dir |> File.mkdir_p

      resized_image = [output_dir, "#{Path.basename(icon_file, ".png")}_#{size}.png"] |> Path.join

      open(icon)
      |> copy
      |> resize("#{size}x#{size}!")
      |> save(resized_image)

      IO.puts "#{resized_image} generated!"
    end

    IO.puts "\nFinished with success!\n"
  end
  
  defp resize_tab_file(tab) do
    icon_file = Path.expand(tab)

    for %{output_dir_name: output_dir_name, size: size, scale: scale} <- @tab_sizes do
      output_dir = [Path.dirname(icon_file), output_dir_name] |> Path.join

      output_dir |> File.mkdir_p

      resized_image = [output_dir, "#{Path.basename(icon_file, ".png")}_#{size}_#{scale}.png"] |> Path.join

      open(tab)
      |> copy
      |> resize("#{size}x#{size}!")
      |> save(resized_image)

      IO.puts "#{resized_image} generated!"
    end

    IO.puts "\nFinished with success!\n"
  end
  
  

  def main(args) do
    # {[icon: icon], _, _} = OptionParser.parse(args)
    # resize_icon_file(icon)
	
	{options, _, _}  = OptionParser.parse(args)

	result = hd(options) |> elem(0) |> to_string
		
	cond do
		result === "tab" ->
			resize_tab_file(hd(options) |> elem(1))
		result === "t" ->
			resize_tab_file(hd(options) |> elem(1))
		result === "icon" ->
			resize_icon_file(hd(options) |> elem(1))
		result === "i" ->
			resize_icon_file(hd(options) |> elem(1))
	end
	
  end
end
