# WebSnap

Create snapshot of webpage. Uses [wkhtmltoimage](http://github.com/antialize/wkhtmltopdf) on the backend which renders HTML using Webkit.

## Installation

1. Install wkhtmltoimage (optional)
** WebSnap comes bundled with wkhtmltoimage binaries for Linux i386 and OS X i386
** WebSnap defaults to user installed versions of wkhtmltoimage if found
** Installing wkhtmltoimage binary
*** Download the latest binary from http://code.google.com/p/wkhtmltopdf/downloads/list
*** Place the binary somewhere on your path (e.g /usr/local/bin)
2. Install WebSnap

    $ gem install websnap
   
## Usage
    
    # WebSnap.new takes the HTML and any options for wkhtmltoimage
    # run `wkhtmltoimage -H` for a full list of options
    snap = WebSnap.new('http://google.com', :format => 'png')

    # Get the binary image data
    png = snap.bytes

    # Save the PDF to a file
    file = snap.to_file('/path/to/save/png')
    
    # WebSnap.new can optionally accept a URL or a File.
    kit = WebSnap.new('http://google.com')
    kit = WebSnap.new(File.new('/path/to/html'))

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Francis Chong. See LICENSE for details.