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

  def main(args) do
    {[icon: icon], _, _} = OptionParser.parse(args)

    resize_icon_file(icon)
  end
end
