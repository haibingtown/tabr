
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tabr <img src="man/figures/logo.png" style="margin-left:10px;margin-bottom:5px;" width="120" align="right">

**Author:** [Matthew Leonawicz](https://leonawicz.github.io/blog/)
<a href="https://orcid.org/0000-0001-9452-2771" target="orcid.widget">
<image class="orcid" src="https://members.orcid.org/sites/default/files/vector_iD_icon.svg" height="16"></a>
[![gitter](https://img.shields.io/badge/GITTER-join%20chat-green.svg)](https://gitter.im/leonawicz/tabr)
<br/> **License:** [MIT](https://opensource.org/licenses/MIT)<br/>

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build
Status](https://travis-ci.org/leonawicz/tabr.svg?branch=master)](https://travis-ci.org/leonawicz/tabr)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/leonawicz/tabr?branch=master&svg=true)](https://ci.appveyor.com/project/leonawicz/tabr)
[![Coverage
Status](https://img.shields.io/codecov/c/github/leonawicz/tabr/master.svg)](https://codecov.io/github/leonawicz/tabr?branch=master)

[![CRAN
status](http://www.r-pkg.org/badges/version/tabr)](https://cran.r-project.org/package=tabr)
[![CRAN
downloads](http://cranlogs.r-pkg.org/badges/grand-total/tabr)](https://cran.r-project.org/package=tabr)
[![Github
Stars](https://img.shields.io/github/stars/leonawicz/tabr.svg?style=social&label=Github)](https://github.com/leonawicz/tabr)

## Overview <img src="https://github.com/leonawicz/tabr/blob/master/data-raw/tabr_logo.png?raw=true" width=320 style="float:right;margin-left:10px;width:320px;">

The `tabr` package provides a music notation syntax and a collection of
music programming functions for generating, manipulating, organizing and
analyzing musical information in R. The music notation framework
facilitates creating and analyzing music data in notation form.

Music programming in the notation syntax provided by `tabr` can be used
for a variety of purposes, but it also integrates cohesively with the
package’s transcription functions. The package also provides API wrapper
functions for transcribing music notation in R into guitar tablature
(“tabs”) using [LilyPond](http://lilypond.org/).

LilyPond is an open source music engraving program for generating high
quality sheet music based on markup syntax. `tabr` generates LilyPond
files from R code and can pass them to LilyPond to be rendered into
sheet music pdf files from R. While LilyPond caters to sheet music in
general and `tabr` can be used to create basic sheet music, the
transcription functions focus on leveraging LilyPond specifically for
creating quality guitar tablature.

While LilyPond is listed as a system requirement for `tabr`, you can use
many package functions without installing LilyPond if you do not intend
to render tabs.

### Use case considerations

`tabr` offers a useful but limited LilyPond API and is not intended to
access all LilyPond functionality from R, nor is transcription via the
API the entire scope of `tabr`. If you are only creating sheet music on
a case by case basis, write your own LilyPond files manually. There is
no need to use `tabr` or limit yourself to its existing LilyPond API or
it’s guitar tablature focus.

However, if you are generating music notation programmatically, `tabr`
provides the ability to do so in R and offers the added benefit of
converting what you write in R code to the LilyPond file format to be
rendered as printable sheet music.

With ongoing development, the music programming side of `tabr` will
likely continue to grow much more than the transcription functionality.

### Why LilyPond for transcription?

LilyPond is an exceptional sheet music engraving program.

  - It produces professional, high quality output.
  - It is open source.
  - It offers a command line access point for a programmatic approach to
    music notation.
  - It is developed and utilized by a large community.
  - Most GUI-based applications are WYSIWYG and force a greater
    limitation on what you can do and what it will look like after you
    do it. It is only for the better that `tabr` is the bottleneck in
    transcription limitations rather than the music engraving software
    it wraps around.

### Functionality and support

The `tabr` package offers the following:

  - Render guitar tablature and sheet music to pdf or png.
  - Write accompanying MIDI files that can respect repeat notation and
    transposition in the sheet music (under reasonable conditions).
  - Support tablature for other string instruments besides guitar such
    as bass or banjo.
  - Support for instruments with different numbers of strings.
  - Support for arbitrary instrument tuning.
  - Offers inclusion (or exclusion) of formal music staves above tab
    staves, such as treble and bass clef staves for complete rhythm and
    timing information.
  - If music staff is included, the tab staff can be suppressed, e.g.,
    for vocal tracks.
  - Track-specific setup for features like instrument type, tuning and
    supplemental music staves.
  - Provides common notation such as slide, bend, hammer on, pull off,
    slur, tie, staccato, dotted notes, visible and silent rests.
  - Allows arbitrary tuplet structure.
  - Above-staff text annotation.
  - Percent and volta repeat section notation.
  - Note transposition.
  - Staff transposition.
  - Multiple voices per track and multiple tracks per score.
  - Chord symbols above staff
  - Chord fretboard diagrams and chord chart at top of score.
  - A variety of layout control options covering settings from score
    attributions to font size.
  - Optional alternative input format allowing the user to provide
    string/fret combinations (along with key signature and instrument
    tuning) to map to pitch.

## Installation

You can install tabr from CRAN with:

``` r
install.packages("tabr")
```

You can install tabr from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("leonawicz/tabr")
```

## Noteworthy strings

As a quick introduction and to get oriented to the music notation syntax
offered by `tabr`, consider the concept of a noteworthy string. This is
like any other character string, except that what makes a string
noteworthy is that its content consists strictly of valid `tabr` music
notation syntax. It can be parsed unambiguously and meaningfully into a
musical phrase (see next section) and can be processed as input to the
various package functions that inspect and manipulate musical
information.

A simple character string like `"c e g"`, or alternatively as a vector,
`c("c", "e", "g")`, is a noteworthy string. Even `"a"` is noteworthy. So
are `"a#"` and `"a_"` (sharp and flat). However, `"A"` is not, nor is
`"Z"`. There are other pieces of valid syntax than just the lowercase
letters `a` through `g` and sharp and flat notation. See the package
vignettes for details.

Noteworthiness can be checked on any character string. No supplemental
class is required. When defining noteworthy strings you can define them
like any other character vector. However, you will notice that package
functions that operate on noteworthy strings and whose output is another
noteworthy string will yield a string with the supplemental `noteworthy`
class. This has its own print and summary methods. If you remove the
class with a common R operation like `as.character()`, it does not
impact any subsequent musical manipulation beyond the need to reperform
a noteworthy check.

``` r
x <- "g#4 c5 d#5 g#4c5d#5"
as_noteworthy(x)
#> <Noteworthy string>
#>   Format: space-delimited time
#>   Values: g#4 c5 d#5 <g#4c5d#5>

is_note(x)
#> [1]  TRUE  TRUE  TRUE FALSE
is_chord(x)
#> [1] FALSE FALSE FALSE  TRUE
chord_is_major(x)
#> [1]   NA   NA   NA TRUE
(x <- transpose(x, 1))
#> <Noteworthy string>
#>   Format: space-delimited time
#>   Values: a4 c#5 e5 <a4c#5e5>

summary(x)
#> <Noteworthy string>
#>   Timesteps: 4 (3 notes, 1 chord)
#>   Octaves: integer
#>   Accidentals: sharp
#>   Format: space-delimited time
#>   Values: a4 c#5 e5 <a4c#5e5>

distinct_pitches(x)
#> <Noteworthy string>
#>   Format: space-delimited time
#>   Values: a4 c#5 e5
distinct_pitches(x) %>% pitch_freq() # in Hz
#> [1] 440.0000 554.3653 659.2551
```

`tabr` offers many functions for manipulating musical structures defined
in music notation. See the vignettes for more information on music
programming.

## Basic transcription example

Rendering sheet music is based on building up pieces of musical
information culminating in a score. The fundamental object to consider
in the transcription context is a phrase. A phrase is created from a
noteworthy string and incorporates additional information, most
importantly time and rhythm. It can also include positional information
such as the instrument string on which a note is played. Outside of
rendering tabs, there is no reason to construct phrase objects.
Everything from the phrase object on up is about using the R to LilyPond
pipeline to render some kind of sheet music document.

If you doing music analysis on noteworthy strings and are combining the
note, pitch or chord information with time, that can be done with a
corresponding variable; using a phrase object is not the way to do that
because phrase objects are intended for the construction of LilyPond
markup syntax.

As a brief example, recreate the tablature shown in the image above
(minus the R logo). Here are the steps.

  - Define a musical phrase with `phrase` or the shorthand alias `p`.
  - Add the phrase to a `track`.
  - Add the track to a `score`.
  - Render the score to pdf with `tab`.

The code is shown below, but first some context.

### Constructing a musical phrase

A phrase here does not require a strict definition. Think of it as the
smallest piece of musical structure you intend to string together. The
first argument to `phrase` is a string describing notes of a specific
pitch (or rests: “r”), separated in time by spaces. For chords, just
remove spaces to indicate simultaneous notes. Integers are appended to
indicate the octave number so that the pitch is unambiguous. For
example, a rest followed by a sequence of notes might be given by `notes
= "r a2 c3 f3 d3 a3 f3"`.

The second argument is a similar string giving note metadata. In this
example there is nothing to add but the time durations. Whole notes
taking up an entire measure of music are given by 1, half notes by 2,
quarter notes 4, eighth notes 8, and so on. To specify a quarter note
rest followed by a sequence of eighth notes, use `info =
"4 8 8 8 8 8 8"` (or shorten to just `info = "4 8*6"`). This basic
example does not require specifying additional note information such as
dotted notes for different fractions of time, staccato notes,
ties/slurs, slides, bends, hammer ons and pull offs, etc. These
specifications are currently available in `tabr` to varying degrees of
development and are covered in the vignette tutorials.

The third argument, `string`, is optional but generally important for
guitar tablature. In similar format, it specifies the strings of the
guitar on which notes are played. Providing this information fixes the
fret-string combinations so that LilyPond does not have to guess what
position on the neck of the guitar to play a specific note. An inability
to specify this in various tablature notation software (or laziness by
the user), is a common cause of inaccurate tabs scouring the internet,
where even when the notes are correct they are written in the tab
suggesting they be played in positions no one would sensibly use. Note
that the `x` shown below is just a placeholder indicating no need to
specify a string for the quarter note rest.

The example below employs a couple shortcuts to further reduce typing.
The first is to use the `*` in-string expansion operator mentioned above
to avoid typing a long series of eighth notes. Second, it drops explicit
reference to octave number three since this central octave is the
default octave in LilyPond. This applies to all but the first note
below.

While explicit string numbers are not needed for this example, they are
provided anyway for full context. Dropping the `string` argument would
further reduce typing.

### Score metadata and accessing LilyPond

Finally, specify some song metadata to reproduce the original staff: the
key of D minor, common time, and the tempo.

If LilyPond is installed on your system (and added to your system path
variable on Windows systems), `tab` should call it successfully. Windows
users are recommended to just add LilyPond’s `bin` directory to the
system path. This will take care of LilyPond as well as its bundled
Python and MIDI support. As an example for Windows users, if the
LilyPond executable is at `C:/Program Files
(x86)/LilyPond/usr/bin/lilypond.exe`, then add `C:/Program Files
(x86)/LilyPond/usr/bin` to the system path.

### R code

``` r
library(tabr)

p("r a2 c f d a f", "4 8*6", "x 5 5 4 4 3 4") %>% track %>% score %>%
  tab("phrase.pdf", key = "dm", time = "4/4", tempo = "4 = 120")
```

    #> #### Engraving score to phrase.pdf ####
    #> GNU LilyPond 2.18.2
    #> Processing `./phrase.ly'
    #> Parsing...
    #> Interpreting music...
    #> Preprocessing graphical objects...
    #> Interpreting music...
    #> MIDI output to `./phrase.mid'...
    #> Finding the ideal number of pages...
    #> Fitting music on 1 page...
    #> Drawing systems...
    #> Layout output to `./phrase.ps'...
    #> Converting to `./phrase.pdf'...
    #> Success: compilation successfully completed

<br/>

For comparison, if you were using string-fret specification to construct
the above phrase, one way to do so is the following:

``` r
sfp("r;r;4 5;0;8 3 4;3; 0 3;2; 4;3;")
#> <Musical phrase>
#> r4 <a,\5>8 <c\5>8 <f\4>8 <d\4>8 <a\3>8 <f\4>8
```

It may not look particularly beneficial here, but for more complex music
it can be easier to reason about the phrase under construction when
using this format to bind information by time step rather. See
`?sf_phrase` for a comparison with `phrase` and the various ways you can
do phrase construction in `tabr` for equivalent results. If you are
looking to do quick, easy and basic tabbing, you may want to consider
using the single-argument input method of the `sf_phrase` function. The
package vignettes focus on general use cases using the `phrase` function
rather than `sf_phrase`.

Note above that `tabr` also exports the pipe `%>%` operator. Even given
the hierarchy of objects involved in the series of steps to move from a
phrase to a rendered pdf, a short example like this does not even
require a single assignment. While music can be quite complex and a full
score will be much longer, `tabr` strives to minimize the work while
still forcing some sense of interpretable, organized structure. For long
and complex music, it can require some effort and practice to ensure
your approach to transcription in your R code is not opaque.

## References and resources

There are several vignette tutorials and examples at the `tabr`
[website](https://leonawicz.github.io/tabr/).

<img src="https://raw.githubusercontent.com/r-music/site/master/img/logo.png" style="float:left;margin-right:20px;" width="120">

<div>

<h3 style="padding-top:50px;">

R-Music

</h3>

<h4 style="padding:0px;margin-top:5px;margin-bottom:5px;">

R for music data extraction and analysis

</h4>

See the <a href="https://github.com/r-music">R-Music</a> organization on
GitHub for more R packages related to music data extraction and
analysis.<br/> The R-Music <a href="https://r-music.rbind.io/">blog</a>
provides package introductions and examples.

</div>

### Other packages

  - The [tuneR](https://CRAN.R-project.org/package=tuneR) package for
    analysis of music and speech by Uwe Ligges, Sebastian Krey, Olaf
    Mersmann, and Sarah Schnackenberg.

-----

Please note that this project is released with a [Contributor Code of
Conduct](https://leonawicz.github.io/tabr/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.
