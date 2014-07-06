
terminal-holylight
==================

An AppleScript to change terminal-profile depending on your Macbook's
ambient light sensor.


Defaults
--------

To override the defaults, you'll need to edit the plist-file ATM. Works for
me, but please post a pull request if that's just too much hassle.

- ThrottleInterval: 20
- Threshold: 100000
- Light theme name: Light
- Dark theme name: Dark


Installation
------------

You'll be asked for your password, as root-user is required to install the
launch agent. Ones installed, you'll need to log out and in for the change
to take effect.

    $ make
    $ make install


Author
------

Henrik Kjelsberg <hkjels@me.com>


Credit
------

- Samy Dindane <samy@dindane.com> (http://dinduks.com/)  
  Samy created [holylight for vim](https://github.com/Dinduks/vim-holylight)
  and the binary that `terminal-holylight` uses to check for ambient light.


License
-------

> (The MIT License)
>
> Copyright (c) 2014 Henrik Kjelsberg &lt;hkjels@me.com&gt;
>
> Permission is hereby granted, free of charge, to any person obtaining
> a copy of this software and associated documentation files (the
> 'Software'), to deal in the Software without restriction, including
> without limitation the rights to use, copy, modify, merge, publish,
> distribute, sublicense, and/or sell copies of the Software, and to
> permit persons to whom the Software is furnished to do so, subject to
> the following conditions:
>
> The above copyright notice and this permission notice shall be
> included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

