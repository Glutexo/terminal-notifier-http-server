# terminal-otifier HTTP Server #

This is a trivial HTTP interface to the [terminal-notifier](https://github.com/julienXX/terminal-notifier) app. It can be used to send notifications to the  macOS (former OS X) Notification Center via HTTP. It uses [Sinatra](http://www.sinatrarb.com) to do all the non-magical magic.

One reason to do so is sending notifications to a remote machine.

Another one is that it allows sending notifications from a web server running on localhost. The web server service usually is usually run by a different user account than the desktop, normally *_www*. However, terminal-notifier sends the notification for the current user and it can not send it for a different one. This HTTP server can be used as a workaround: Run it using your desktop user account and send the notifications to it over HTTP.

## Usage ##

1. Run the server.

```
$ ./server.rb
```

2. Send something to it. All the GET or POST params are directly translated to the named arguments of the `TerminalNotifier.notify` method. The only exception is the *message* key that conveys a body of the notification. It is sent as a first argument of the `TerminalNotifier.notify` method and does not become a part of the named arguments hash.

```
$ curl 'http://localhost:4001/notify?message=world!&title=Hello'
```

