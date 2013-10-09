# ExtraDoilies

I really like [table cloth](https://github.com/bobbytables/table_cloth).

This project is some extra stuff for table_cloth.

`gem 'extra_doilies'` gets you:

```ruby
class BookTable < TableCloth::Base
  column :"#", using: ExtraDoilies::CounterColumn
  column :title, using: ExtraDoilies::LinkedColumn
  column :author, using: ExtraDoilies::LinkedAssociationColumn
```

This will get you a numbered column, a title column (linked to the ActiveModel object), and a column for author, with links to that author. Woo!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
