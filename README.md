# RefilePreprocess

This plugin is create preprocessed file on upload time.
You can omit the execution time of the process process at the time of browsing.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'refile_preprocess', github: "mountposition-team/refile_preprocess"
```

And then execute:
```bash
$ bundle
```

## Dependencies

- rails ~> 5.0.0
- refile ~> 0.6.0

## Attachments

You've already seen the attachment method:

```
class User < ActiveRecord::Base
  attachment :profile_image, preprocess: [[:fill, 500, 667], [:fill, 2100, 2800]]
```

If you upload a file, refile create preprocessed file `#{refile_id}x#{preprocessor_name}x#{preprocessor_options.join('x')}`.

    e.g.
      `bd6b84a2f2b9575f6ff85aadde4853c414e66633f24952b59be5d88055bexfillx500x667` and
      `bd6b84a2f2b9575f6ff85aadde4853c414e66633f24952b59be5d88055bexfillx2100x2800`
 

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
