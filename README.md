# Json2

Json2 transforms a Json file into a Csv one.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json2

## Usage

### Example 1

Given the following Json file:

```json
[
	{
		"color": "red",
		"value": "#f00"
	},
	{
		"color": "green",
		"value": "#0f0"
	},
	{
		"color": "blue",
		"value": "#00f"
	}
]
```

You could obtain a Csv with a header like that:

    $ json2 colors-array.json 
    color,value
    red,#f00
    green,#0f0
    blue,#00f

### Example 2

With this simpler kind of Json:

```json
{
    "red":"#f00",
    "green":"#0f0",
    "blue":"#00f"
}
```

Here is the resulting Csv:


    $ json2 colors3.json 
    red,green,blue
    #f00,#0f0,#00f

### Example 3

Take a slightly more complicated Json file:

```json
{
	"id": "0001",
	"type": "donut",
	"batters":
		{
			"batter":
				[
					{ "id": "1001", "type": "Regular" },
					{ "id": "1002", "type": "Chocolate" },
					{ "id": "1003", "type": "Blueberry" },
					{ "id": "1004", "type": "Devil's Food" }
				]
		},
	"topping":
		[
			{ "id": "5001", "type": "None" },
			{ "id": "5002", "type": "Glazed" },
			{ "id": "5005", "type": "Sugar" }
		]
}
```

Say you want to extract the *batter* stuff. Use the `--path` switch:

    $ json2 --path='batters.batter' products.json 
    id,type
    1001,Regular
    1002,Chocolate
    1003,Blueberry
    1004,Devil's Food

### Example 4

Json don't always map very well with Csv.
Sometimes there is simply no header information inside the Json:

```json
{
    "Nom du parti": {
        "Abstention": [
            "Jean"
        ],
        "Non-votant": [],
        "Contre": [
            "Alice",
            "Georges"
        ],
        "Pour": [
            "Julie"
        ]
    }
}
```

In this case, you can use the `--without-header` switch:

    $ json2 --without-header votes.json 
    Nom du parti,Abstention,Jean
    Nom du parti,Non-votant,
    Nom du parti,Contre,Alice
    Nom du parti,Contre,Georges
    Nom du parti,Pour,Julie

## Contributing

1. Fork it ( https://github.com/[my-github-username]/json2/fork )
2. **Create your feature branch** (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT

## Questions and/or Comments

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
