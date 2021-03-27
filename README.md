# Base32.cr

Base32 Encoding for [Crockford's Base32](https://www.crockford.com/base32.html).
* Currently supports only **`Int64`** for encoder input

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     base32:
       github: maiha/base32.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "base32"

Base32.encode(123456789012) # => "3JZ9J6GM"
Base32.decode("3JZ9J6GM")   # => 123456789012
```

## Contributing

1. Fork it (<https://github.com/maiha/base32.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) - creator and maintainer
