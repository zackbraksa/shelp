# Shelp

A command line tool that translates natural language into shell commands, using OpenAI's GPT models.

DISCLAIMER: This is work in progress and might be rough around the edges. Please be patient and report any issues you encounter.

## Installation

Install the gem by executing:

```bash
gem install shelp
```

## Usage

To use the tool, you need to have an OpenAI API key. You can get one by signing up at [OpenAI](https://platform.openai.com/signup).

Once you have your API key, you can set it as an environment variable:

```bash
export OPENAI_API_KEY=your-api-key
```

Then you can run the CLI by executing:

```bash
shelp ask "How do I exclude files from a zip archive?"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/zackbraksa/shelp>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/zackbraksa/shelp/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Shelp project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/zackbraksa/shelp/blob/main/CODE_OF_CONDUCT.md).
