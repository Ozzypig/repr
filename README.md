# repr

`repr` is a simple Lua function that works a lot like [Python's repr](https://docs.python.org/3/library/functions.html#repr). It converts a Lua value into a printable string.

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

```
print(repr(myTable, {pretty=true}))
```

Here is an example that shows off all the bells and whistles:

```
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

## Version History

* 5 May 2019 - v1.0 Initial release
* 6 May 2019 - v1.1 Now supports all Roblox data types (Vector3, Color3, etc.)
* 5 June 2019 - This repository was created.

## License

This work (the Lua code, model, and plugin) is licensed under the WTFPL (http://www.wtfpl.net). Go nuts. Let me know if it helped you make something cool. Please don’t to use it for world domination (it’s where I keep my stuff). A copy of the WTFPL is provided in the LICENSE file.