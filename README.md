slicker
-------

It's raining XSS out there. Time for a slicker!

Simple XSS protection was a feature of some early Rails plugins, notably WhiteList and sanitize_params, which defended your application at the front door - the params hash, where you probably get most of your input.  

This is a port of the basic sanitize_params strategy into gem format, and with no dependency on Rails - it will also work in Sinatra, Padrino, or a straight Ruby application.

Usage
=====

Using it is pretty simple. In its most basic form:

```ruby
# Rails
before_filter :protect_from_xss


# Padrino
before do
  protect_from_xss
end


# Either framework
def protect_from_xss
  Slicker.protect(params)
end
```

Drop that in your ApplicationController (for Rails) or your app.rb file (Sinatra or Padrino), and you're done: all HTML will be stripped from all params hitting your application. Of course, the disadvantage of this is that all HTML will be stripped from all params hitting your application.

You can loosen this up in several different ways.

Slicker depends on sanitize, so you can also pass a Sanitize config through, and strip only certain tags:

    Slicker.protect(params, Sanitize::Config::BASIC)

See the Sanitize[https://github.com/rgrove/sanitize] documentation for more information on what you can pass.

Another way to loosen things up is to be a bit more selective in your filters, perhaps by using `skip_before_filter` or by not putting the filter in the superclass of the entire application.

Contributing to slicker
=======================

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=========

Copyright (c) 2012-2018 [Dave Hrycyszyn](http://constructiveproof.com). See LICENSE.txt for further details.

