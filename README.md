Blabber
===

Blabber helps us monitor long running jobs without having to watch them in the terminal.

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

blabber = Blabber::Blabber.new(
    'Blabber::Console' => {'loglevels' => all_standard_loglevels},
    'CustomConsole' => {'loglevels' => ['INFO', 'WARN', 'ERROR']},
    'Blabber::Campfire' => {
        'account' => 'campfireaccount', 
        'token' => 'abc123', 
        'room' => 'My Room',
        'loglevels' => ['INFO', 'WARN', 'ERROR', 'DEBUG', 'CAMPFIRE']
    })

blabber.debug("debug msg")
blabber.info("info msg")
blabber.error("error msg")
blabber.warn("warn msg")
blabber.debug("multiline\nmessage")
blabber.campfire("just to campfire")
```

### Credits
@benfollis
