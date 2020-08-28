# repr

`repr` is a simple Lua function that works a lot like [Python's repr](https://docs.python.org/3/library/functions.html#repr). It converts a Lua value into a printable string.

## Quick Install

Paste the following into the **Command Bar** (View &lt; Command Bar) in Roblox Studio. It will use [HttpService](https://developer.roblox.com/en-us/api-reference/class/HttpService) to download and insert repr into [ReplicatedStorage](https://developer.roblox.com/en-us/api-reference/class/ReplicatedStorage) automatically.

```lua
local Url = "https://raw.githubusercontent.com/Ozzypig/repr/master/repr.lua"
local HttpService = game:GetService("HttpService")
local httpEnabled = HttpService.HttpEnabled
HttpService.HttpEnabled = true
local script = Instance.new("ModuleScript", game:GetService("ReplicatedStorage"))
script.Name = "repr"
game:GetService("Selection"):Set{script}
script.Source = HttpService:RequestAsync{Url=Url;}.Body
HttpService.HttpEnabled = httpEnabled
```

Alternatively, [&darr; Download the latest model file from GitHub releases](https://github.com/Ozzypig/repr/releases/latest/download/repr.rbxmx)

## Usage

Call the function with any single value and it will return a string.

```lua
-- Note: On Roblox, you can require the following asset ID:
local repr = require(3148021300)

local myTable = {
   hello = "world";
   score = 5;
   isCool = true;
}
print(repr(myTable)) --> {hello = "world", isCool = true, score = 5}
```

The second value can be a table of options, which allows you to **pretty-print** with newlines:

```lua
print(repr(myTable, {pretty=true}))
```

Here is an example that shows off all the bells and whistles:

```lua
local repr = require(3148021300)
 
local myTable = {
	hello = "repr",
	usefulness = 9001,
	isEasyToUse = true,
	array = {"numerical", "arrays", "are", "easy"},
	land = workspace["a b c"]["1 2 3"],
	subTables = {
		moreInfo = "calls itself recursively to print sub-tables"
	},
	usesToString = {__tostring = function () return "__tostring functions are called automatically" end},
	["$YMBOL$"] = "keys that aren't Lua identifiers are quoted";
	[{also = "tables as keys work too";}] = "in case you need that",
	cyclic = {note = "cyclical tables are printed as just {CYCLIC}"}
}
-- create a cycle:
myTable.cyclic.cyclic = myTable.cyclic
 
local reprSettings = {
	pretty = false;              -- print with \n and indentation?
	semicolons = false;          -- when printing tables, use semicolons (;) instead of commas (,)?
	sortKeys = true;             -- when printing dictionary tables, sort keys alphabetically?
	spaces = 3;                  -- when pretty printing, use how many spaces to indent?
	tabs = false;                -- when pretty printing, use tabs instead of spaces?
	robloxFullName = false;      -- when printing Roblox objects, print full name or just name? 
	robloxProperFullName = true; -- when printing Roblox objects, print a proper* full name?
	robloxClassName = true;      -- when printing Roblox objects, also print class name in parens?
}
print(repr(myTable, reprSettings))
```

## Development and Building

You can use [Rojo](httos://github.com/Roblox/rojo) 0.5.x to build repr into a `repr.rbxmx`, which you can include in your Roblox places.

```bash
$ rojo serve
$ rojo build --output repr.rbxmx
```

Building repr into a model file can also be done by invoking GNU `make`.

## Version History

* 5 May 2019 - v1.0 Initial release
* 6 May 2019 - v1.1 Now supports all Roblox data types (Vector3, Color3, etc.)
* 5 June 2019 - This repository was created.
* 28 August 2020 - v1.2. DateTime support; added Rojo [project](default.project.json) and [Makefile](Makefile) to this repository.

## License

This work (the Lua code, model, and plugin) is licensed under the WTFPL (http://www.wtfpl.net). Go nuts. Let me know if it helped you make something cool. Please don’t to use it for world domination (it’s where I keep my stuff). A copy of the WTFPL is provided in the LICENSE file.
