# Ruby Go

A gem that implements the rules of go (igo, weiqi, baduk). This fork specifically handles boards of irregular dimensions.

## Use

```
game = RubyGo::Game.new(19, 77)
```

```
# coordinates are array-notated starting at 0
game.place_black(3,3)
game.place_white(15,15)

# ...

game.pass_black
game.pass_white
```

### Printers

There are a few printers included in the gem, including `TextPrinter` and `HTMLPrinter`.

The printer takes an `IO` like object, and can print the game.
```
printer = RubyGo::TextPrinter.new($stdout)
printer.print_game(game)
```

### rubygo Command Line Interface

The rubygo executable included in the gem is CLI that plays the game of go.
