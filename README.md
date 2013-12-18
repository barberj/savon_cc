# SavonCC

CarbonCopy Savon responses to disk for mocking use later

## Installation

Add this line to your application's Gemfile:

    gem 'savon_cc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install savon_cc

## Usage

Just require gem and it will write response down to disk in the format '#{operation_name}_#{timestamp}.xml'

  ```ruby
    require 'savon_cc'
  ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
