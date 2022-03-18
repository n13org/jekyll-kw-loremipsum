# jekyll-kw-loremipsum

![CI](https://github.com/n13org/jekyll-kw-loremipsum/workflows/CI/badge.svg)
![Coverage](https://github.com/n13org/jekyll-kw-loremipsum/workflows/Coverage/badge.svg)
![RuboCop](https://github.com/n13org/jekyll-kw-loremipsum/workflows/RuboCop/badge.svg)

[![Gem Version](https://badge.fury.io/rb/jekyll-kw-loremipsum.svg)](https://badge.fury.io/rb/jekyll-kw-loremipsum)

LoremIpsum is a [jekyll][Jekyll Website] plugin. The plugin can be used as a **tag** for jekyll. You can get some dummy text for your webpage, without copy & pasting the Lorem Ipsum words yourself.

- Use the tag `{% kw_lorem_ipsum 30w %}` to get 30 different words.
- Use the tag `{% kw_lorem_ipsum random 4p 7miw 12maw %}` to get 4 paragraphs between 7 and 12 words.

## 🚀 Installation

Add this section to your application's `Gemfile` inside the `jekyll_plugins` and execute `bundle install`

```ruby
group :jekyll_plugins do
  gem 'jekyll-kw-loremipsum'
end
```

Or install the dependency with `bundle` itself, you can use the option `--skip-install`, when `bundle install` will be called later

```sh
bundle add jekyll-kw-loremipsum --group jekyll_plugins 
```

Then add the following to your site's `_config.yml` to activate the plugin, see also the [Configuration](#%EF%B8%8F-configuration) section to change the default configuration. 

```yaml
plugins:
  - jekyll-kw-loremipsum
```

> The Plug-In is tested with jekyll 3.8, 3.9, 4.0 and 4.1!

## 🔥 Usage

## ⏰ Changelog

* ...
* Build GitHub CI workflows
* Prepare CI-workflow with Appraisal `bundle exec appraisal install`
* 0.0.2 Read the [NextSteps.md](NextSteps.md) and follow the introduction steps
* 0.0.1 Install [Visual Studio Extension - Folder Templates](https://marketplace.visualstudio.com/items?itemName=Huuums.vscode-fast-folder-structure), and run `NewJekyllPlugInAsRubyGem` to get the a skeleton project from template
* 0.0.0 Create project `jekyll-kw-loremipsum` from [template][GitHub jekyll-plugin-template]

## ⚙️ Configuration

Add `jekyll-kw-loremipsum` section to `_config.yml` configure the plugin globally. If you want to use defaults you can omit the config-section.

```yaml
jekyll-kw-loremipsum:
  my_boolean: false
  my_string: 'sha384'
  my_number: 1.23
```

Configuration values, the `default` value is in **bold**

| Key | Description | Values (**default**) |
|-----|-------------|----------------------|
| my_boolean | A boolean value    | **false**, true |
| my_string  | A string           | foo, **hello plugin**, bar |
| my_number  | A (decimal) number | **0** |

## 📝 Notes / Hints

TODO: Add notes, hints and learnings

## 👋 Contribution

TODO: How to contribute, e.g. [CONTRIBUTING.md](CONTRIBUTING.md)

## 🏆 Kudos

TODO: Add big thanks and kudos persons / links / blogs

## ✅ Template

The project was created from the template [GitHub n13org/jekyll-plugin-template][GitHub jekyll-plugin-template]. We would ❤️ when you keep the reference. Thanks!

[GitHub jekyll-plugin-template]: https://github.com/n13org/jekyll-plugin-template
[Jekyll Website]: https://jekyllrb.com/
