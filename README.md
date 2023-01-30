# rstaninvgamma

R package to draw samples from an inverse gamma via Stan

## Install

```r
## Install package from github
devtools::install_github("luisdamiano/rstaninvgamma")
```

## Use

```r
## Draw 1000 samples from an inverse gamma with alpha = .9 and beta = 1.2
rstaninvgamma::rinvgamma(1000, 0.9, 1.2)
```
