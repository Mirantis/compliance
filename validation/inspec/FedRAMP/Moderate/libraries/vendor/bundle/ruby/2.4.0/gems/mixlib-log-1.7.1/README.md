# Mixlib::Log

[![Build Status Master](https://travis-ci.org/chef/mixlib-log.svg?branch=master)](https://travis-ci.org/chef/mixlib-log) [![Gem Version](https://badge.fury.io/rb/mixlib-log.svg)](https://badge.fury.io/rb/mixlib-log)

Mixlib::Log provides a mixin for enabling a class based logger object, a-la Merb, Chef, and Nanite. To use it:

```ruby
require 'mixlib/log'

class Log
  extend Mixlib::Log
end
```

You can then do:

```ruby
Log.debug('foo')
Log.info('bar')
Log.warn('baz')
Log.error('baz')
Log.fatal('wewt')
```

By default, `Mixlib::Logger` logs to STDOUT. To alter this, you should call +Log.init+, passing any arguments to the standard Ruby Logger. For example:

```ruby
Log.init('/tmp/logfile')  # log to /tmp/logfile   
Log.init('/tmp/logfile', 7)  # log to /tmp/logfile, rotate every day
```

Enjoy!

## LICENSE:

- Copyright:: Copyright (c) 2008-2016 Chef Software, Inc.
- License:: Apache License, Version 2.0

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
