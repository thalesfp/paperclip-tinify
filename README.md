# Paperclip Tinify

JPEG and PNG compression processor for Paperclip using [Tinify](http://tinify.com) API.

## Installation

Add to your Gemfile.

````ruby
gem 'paperclip-tinify'
````

Configure your API key in config/initializers/paperclip.rb:

````ruby
Paperclip::Tinify.tinify_key = 'YOUR_API_KEY'
````

## API Key

Please visit [Tinify](http://tinify.com) to generate your API key.

## Usage
This is the basic usage. This will compress both JPEG and PNG files with the default options.

````ruby
class User < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: '300x300>', thumb: '100x100>' },
    processors: [:tinify]
end
````

## License
paperclip-tinify is released under the [MIT License](https://github.com/emrekutlu/paperclip-compression/blob/master/LICENSE.txt).

