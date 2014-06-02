[![Build Status](https://travis-ci.org/biesiad/deelay.png)](https://travis-ci.org/biesiad/deelay)
[![Code Climate](https://codeclimate.com/github/biesiad/deelay.png)](https://codeclimate.com/github/biesiad/deelay)
[![Gem Version](https://badge.fury.io/rb/deelay.png)](http://badge.fury.io/rb/deelay)

# [Deelay.me](http://deelay.me)

**Inline delay proxy for http resources**

Slow loading resources (images, scripts, etc) can break your code. Test it simulating unexpected network conditions applied to specific resource.


## Installation
```sh
$ gem install deelay
$ deelay

== Sinatra/1.3.3 has taken the stage on 4567 for development with backup from Thin
Thin web server (v1.4.1 codename Chromeo)
Maximum connections set to 1024
Listening on 0.0.0.0:4567, CTRL+C to stop
```

## Usage

```html
<img src="localhost:4567/1000/http://mysite.com/image.gif">
```
