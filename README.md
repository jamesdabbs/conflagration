# Conflagration

## What

A dumb thing to save models to a JSON file

## Why

[Figaro](https://github.com/laserlemon/figaro) is great. Sometimes I want to be able to edit settings with a `form_for` though.

## How

```
class Configurator < Conflagration
  path Rails.root.join "db", "#{Rails.env}.json"

  attribute :some_path
end

c = Configurator.read
c.update some_path: some_new_path
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/conflagration/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
