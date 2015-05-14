# Icon Resizer

A command line tool made in elixir to help creating icons for your apps

## Installing Dependencies
1. Install Elixir using Homebrew

		brew install elixir

2. Install Imagemagick

		brew install imagemagick

3. Git clone this repo

		git clone https://github.com/augustorsouza/icon_resizer.git

4. Enter the cloned repo directory and install dependencies with mix

		cd icon_resizer
		mix do deps.get, deps.compile

## How to build

1. Git clone this repo

		git clone https://github.com/augustorsouza/icon_resizer.git

2. Enter the cloned repo directory and install dependencies with mix

		cd icon_resizer
		mix do deps.get, deps.compile

3. Build the executable with mix

		mix escript.build

## How to use

1. Git clone this repo

		git clone https://github.com/augustorsouza/icon_resizer.git

2. Enter the cloned repo directory

		cd icon_resizer

3. Run the executable passing a --icon parameter that must point to the icon file in png format sized 1024x1024

		./icon_resizer --icon /path/to/the/1024size/icon
