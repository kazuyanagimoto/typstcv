

# typstcv

<!-- badges: start -->

<a href="https://kazuyanagimoto.r-universe.dev"><img src="https://kazuyanagimoto.r-universe.dev/badges/typstcv" class="img-fluid" alt="R-universe status badge"></a>
[![R-CMD-check](https://github.com/kazuyanagimoto/typstcv/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kazuyanagimoto/typstcv/actions/workflows/R-CMD-check.yaml)
<a href = "https://github.com/kazuyanagimoto/typstcv/blob/main/LICENSE.md" target = "_blank"><img src="https://img.shields.io/badge/license-MIT-blue"></a>
[![Docs](https://img.shields.io/badge/docs-homepage-blue.svg)](https://kazuyanagimoto.com/typstcv/index.html)
<!-- badges: end -->

![](vignettes/typstcv.svg)

This package provides helper functinons for
[kazuyanagimoto/quarto-awesomecv-typst](https://github.com/kazuyanagimoto/quarto-awesomecv-typst).
This work are inspired by these three works:

-   Byungjin Park’s [Awesome-CV](https://github.com/posquit0/Awesome-CV)
    -   A beautiful LaTeX template of CV
-   Paul Tsouchlos’s
    [modern-cv](https://typst.app/universe/package/modern-cv/)
    -   A [Typst](https://typst.app) implementation of Awesome-CV
-   Mitchell O’Hara-Wild and Rob Hyndman’s
    [vitae](https://pkg.mitchelloharawild.com/vitae/)
    -   R package for modern CV, including Awesome-CV

## Installation

You can install the development version of typstcv from R-universe with:

``` r
install.packages("typstcv", repos = "https://kazuyanagimoto.r-universe.dev")
```

## Usage

You can find a simple
[example](https://kazuyanagimoto.com/typstcv/vignettes/typstcv.pdf) and
[qmd](https://github.com/kazuyanagimoto/typstcv/blob/main/vignettes/typstcv.qmd)
code.

### Use Template

You can use the template with `quarto` command.

``` bash
quarto use template kazuyanagimoto/quarto-awesomecv-typst
```

### YAML

Set author information in YAML.

``` yaml
author:
  firstname: Albert
  lastname: Einstein
  address: "Rämistrasse 101, CH-8092 Zürich, Switzerland, Zürich"
  positions: ["Research Physicist",  "Professor"]
  contacts:
    - icon: fa envelope
      text: ae@example.com
      url: "mailto:ae@example.com"
    - icon: PATH_TO_ICON/icon.svg
      text: example.com
      url: https://example.com
```

-   [fontawesome](https://fontawesome.com/search?m=free&o=r) icons are
    supported via
    [duskmoon314/typst-fontawesome](https://github.com/duskmoon314/typst-fontawesome)
    with `fa` prefix.
-   SVG icons can be used by specifying the path to the icon file

### Fonts & Color

You can set fonts and the accent color in YAML.

``` yaml
style:
   color-accent: "516db0"
   font-header: "Roboto"
   font-text: "Source Sans Pro"
format:
  awesomecv-typst:
    font-paths: ["PATH_TO_FONT"]
```

### Resume Entries

`resume_entry()` is a helper function to create resume entryies from a
data frame.

``` r
df_educ |>
  resume_entry(
    title = "title",
    location = "location",
    date = "year",
    description = "detail"
)
```
