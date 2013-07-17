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

blabber = Blabber::Blabber.new(
    'console' => {'loglevel' => 'DEBUG'},
    'campfire' => {
        'account' => 'campfireaccount', 
        'token' => 'abc123', 
        'room' => 'My Room',
        'loglevel' => 'INFO'
    })

blabber.debug("debug msg")
blabber.info("info msg")
blabber.error("error msg")
blabber.warn("warn msg")
blabber.debug("multiline\nmessage")
```