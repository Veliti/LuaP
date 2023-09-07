# Cheat-sheat

## Lua character classes

| Class  | Description |
| ----------- | ----------- |
| %a | letters (A-Z, a-z) |
| %c | control characters (\n, \t, \r, ...) |
| %d | 	digits (0-9) |
| %l |	lower-case letter (a-z) |
| %p |	punctuation characters (!, ?, &, ...) |
| %s |	space characters |
| %u |	upper-case letters |
| %w |	alphanumeric characters (A-Z, a-z, 0-9) |
| %x |	hexadecimal digits (\3, \4, ...) |
| %z |	the character with representation 0 |
| . |	Matches any character |
| [*] | Matches characters in [] |
| [a-z] | Matches characters in range a-z |
| [^*] | Not matches characters in [] |

## Lua special characters

| Character | Description |
| ---------- | ---------- |
| (*) | Capture |
| %n (where n is number) | Contents of capture|
| %* | Character escape |
| %baz | Matches substring between a z |
| %f[*] | Captures empty string at transition from not class to class |
| ^ | Start of a line |
| $ | End of a line |

## Quantifires
| Quantifire | Description |
|---|---|
| + | One or more times (longes sequence as posible) |
| - | One or more times (shortest sequence as posible) |
| * | Zero or more times |
| ? | Zero or one |

Links:
#### [RipTutorial Lua](https://riptutorial.com/lua/example/20315/lua-pattern-matching)
#### [Lua.org](https://www.lua.org/pil/20.2.html)
