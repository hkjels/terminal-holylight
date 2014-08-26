
terminal-holylight
==================

An AppleScript to change terminal-profile depending on your Macbook's
ambient light sensor.


![Terminal holylight](https://raw.githubusercontent.com/hkjels/github-images/master/terminal-holylight/terminal-holylight.gif)


Defaults
--------

You will be prompted to set profile-names during build. You can change the
other properties by expressing them explicitly before running make.
Ex. `THROTTLE=10 THRESHOLD=800000 make`


Installation
------------

You'll be asked for your password, as root-user is required to install the
launch agent. Ones installed, you'll need to log out and back in for the
change to take effect.

    $ git clone --recursive https://github.com/hkjels/terminal-holylight.git
    $ cd terminal-holylight
    $ make -s install


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

