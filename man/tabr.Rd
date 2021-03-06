% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tabr.R
\docType{package}
\name{tabr}
\alias{tabr}
\title{tabr: Music notation syntax, manipulation, analysis and transcription in R.}
\description{
The \code{tabr} package provides a music notation syntax and a collection of
music programming functions for generating, manipulating, organizing and
analyzing musical information in R.
}
\details{
The music notation framework facilitates creating and analyzing music data in
 notation form.
Music data can be viewed, manipulated and analyzed while in different
forms of representation based around different data structures: strings and
data frames.
Each representation offers advantages over the other for different use cases.
Music syntax can be entered directly and represented in character strings to
minimize the formatting overhead of data entry by using simple data
structures, for example when wanting to quickly enter and transcribe short
pieces of music to sheet music or tablature.
The package contains functions for directly performing various mathematical,
logical and organizational operations and musical transformations on special
object classes that facilitate working with music data and notation.
The same music data can also be organized in tidy data frames, allowing for
a more familiar and powerful approach to the analysis of large amounts of
structured music data.
Functions are available for mapping seamlessly between these data structures
and their representations of musical information.
The package also provides API wrapper functions for transcribing musical
representations in R into guitar tablature ("tabs") and basic sheet music
using the LilyPond backend <http://lilypond.org>.

LilyPond is an open source music engraving program for generating high
quality sheet music based on markup syntax.
The package generates LilyPond files from R code and can pass them to
LilyPond to be rendered into sheet music pdf files.

While LilyPond caters to sheet music in general and \code{tabr} can be used
to create basic sheet music,
the transcription functions focus on leveraging LilyPond specifically for
creating quality guitar tablature.

The package offers nominal MIDI file output support in conjunction with
rendering sheet music.
The package can read MIDI files and attempts to structure the MIDI data to
integrate as best as possible with the data structures and functionality
found throughout the package.

\code{tabr} offers a useful but limited LilyPond API and is not intended to
access all LilyPond functionality from R,
nor is transcription via the API the entire scope of \code{tabr}.
If you are only creating sheet music on a case by case basis, write your own
LilyPond files manually.
There is no need to use \code{tabr} or limit yourself to its existing
LilyPond API.
If you are generating music notation programmatically,
\code{tabr} provides the ability to do so in R and has the added benefit of
converting what you write in R code to the LilyPond file format to be
rendered as printable guitar tablature.

While LilyPond is listed as a system requirement for \code{tabr}, you can
use the package for music analysis without installing LilyPond if you do not
intend to render tabs.
}
