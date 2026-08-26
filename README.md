screenplay-scripted
===================

<!--toc:start-->
- [screenplay-scripted](#screenplay-scripted)
  - [Functions](#functions)
    - [`slugline`](#slugline)
    - [`minislug`](#minislug)
    - [`dialogue`](#dialogue)
    - [`dual_dialogue`](#dual_dialogue)
    - [`montage`](#montage)
    - [`transition`](#transition)
    - [`character`](#character)
  - [Configuration](#configuration)
    - [`check_strict`](#check_strict)
    - [`bold_slugs`](#bold_slugs)
    - [`dialogue_cont`](#dialogue_cont)
    - [`slug_dashes`](#slug_dashes)
    - [`cont_str`](#cont_str)
  - [Barebones Template](#barebones-template)
<!--toc:end-->

A Typst package to create Oscar-formatted TV or movie scripts drafts with handly helper functions, using [https://www.oscars.org/sites/oscars/files/scriptsample.pdf](https://www.oscars.org/sites/oscars/files/scriptsample.pdf) and [https://www.studiobinder.com/blog/how-to-write-a-screenplay/](https://www.studiobinder.com/blog/how-to-write-a-screenplay/) as primary references.

## Functions

### `slugline`

- Arguments: `int/ext`, `location`, `day/night`
- Shorthand: `sl`

The arguments are auto-capitalized in the final output. The output of this function can be configured by `check_strict`, `bold_slugs`, and `slug_dashes`.

`int/ext`, can be shorthanded with `i` and `e`, and `day/night` can be shorthanded with `d` and `n`.

### `minislug`

- Arguments: `location`
- Shorthand: `ms`

Same description as [slugline](#slugline).

### `dialogue`

- Arguments: `name`, `extension`, `continuation`
- Shorthand: `d`

Manual dialogue continuation is done by setting `continuation` to `true` as needed during page breaks. When manual dialogue continuation is used, it is recommended to set [dialogue_cont](#dialoguecont) to `false`.

The argument `extension` adds on to the cue with: `CUE (<EXTENSION>)`. Note that it is also valid to manually add the extension into the `name` argument.

### `dual_dialogue`

- Arguments: `dialogue_1`, `dialogue_2`

Creates a 2-column block to represent simultaneous dialogue. Pass [dialogue](#dialogue) as `dialogue_{1,2}`.

### `montage`

- Arguments: `description`

Set `description` to match what the montage is about which gets automatically capitalized. An automatic `END MONTAGE` is added at the end. 

### `transition`

- Arguments: `transition`
- Shorthand: `t`

Describes the transition to be applied which gets automatically capitalized.

### `character`

- Arguments: `first`, `middle`, `last`
- Returns: [`first-only`, `first-last`, `first-middle-last`]

Handy helper function to create parameterized character names to be used as needed.

```typ
// Example usage
#let (alice, alice-fl, alice-full) = character("Alice", "Barney", "Miller")

#alice      // outputs "Alice"
#alice-fl   // outputs "Alice Miller"
#alice-full // outputs "Alice Barney Miller"
```

## Configuration

### `check_strict`

When set to `true`, some functions will raise an error when an "unconventional" argument has been used. If you are encountering any frustrations, set this to `false`.

### `bold_slugs`

Set to `true` to bold, `false` to unbold.

### `dialogue_cont`

Allows one to handle page break dialogue manually when set to `false`, or automatically by setting to `true`.

### `slug_dashes`

Can only take the values `"single"` or `"double"`. Affects the dash that shows in the [slugline](#slugline), [minislug](#minislug), and [montage](#montage).

### `cont_str`

Some scripts write the continuation as "CON'T" or "CON'D". Choose whichever one is preferred.

## Barebones Template

```typ
#import "@preview/screenplay-scripted:0.1.0": *

#show: scripted.with(
  title: "YOUR TITLE HERE",
  authors: ("NAME 1", "NAME 2"),
  date: datetime.today(),
  version: "0.0.1",
  info: [
    YOUR-EMAIL\@domain.com \
    (555) 555-5555
  ],
  config: (
    check_strict: false,
    bold_slugs: true,
    dialogue_cont: true, 
    slug_dashes: "single",
    cont_str: "CON'T",
  )
)

#slugline[INT][ROOM][DAY]

You sit at your desk, ready to write something for the world to see.
```
