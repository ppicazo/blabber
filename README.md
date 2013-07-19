Blabber
===

Blabber helps us monitor long running jobs without having to watch them in the terminal.

[![Build Status](https://travis-ci.org/ppicazo/blabber.png)](https://travis-ci.org/ppicazo/blabber)

## Installation

```
$ gem install blabber
```

## Example

```ruby
require "blabber"
require 'blabber/channel'
  
class CustomConsole

  include Blabber::Channel
  attr_reader :opts

  def initialize(opts)
    @opts = opts
  end

  def loglevels
    @opts['loglevels']
  end

  def speak(message, loglevel, opts)
    puts "[#{loglevel}] #{message}"
  end

end

all_standard_loglevels = ['INFO', 'WARN', 'ERROR', 'DEBUG']

blabber = Blabber::Blabber.new([
    {'channel' => 'Blabber::Console', 'loglevels' => all_standard_loglevels},
    {'channel' => 'CustomConsole', 'loglevels' => ['INFO', 'WARN', 'ERROR', 'PLATYPUS']}
])

blabber.debug("debug msg")
blabber.info("info msg")
blabber.error("error msg")
blabber.warn("warn msg")
blabber.debug("multiline\nmessage")
blabber.platypus("just to custom console")
```

## Channels
* [Blabber-Campfire](https://github.com/ppicazo/blabber-campfire) - Campfire channel

## Credits
[@benfollis](https://github.com/benfollis)
