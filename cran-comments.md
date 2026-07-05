## Submission notes

This is a major update of the submission of SSRTcalc to CRAN. It provides stop-signal reaction time (SSRT)
estimation together with Monte Carlo and Bayesian extensions. It also includes updates to the example datasets (cleaning), as well as updates to the authors (the contributor is not affiliated with Texas A&M University any more). More details are available in the package documentation (NEWS.md)

## Test environments

* local: R 4.6.1 on Windows 11 Pro
* win-builder: R-devel and R-release 

## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
## Notes on Suggested backends

The Bayesian functions require one of two MCMC backends:

* 'rstan' is available on CRAN and is listed under Suggests.
* 'cmdstanr' is not on CRAN; it is distributed via the Stan R-universe. It is
  listed under Suggests, and `Additional_repositories` points to
  <https://mc-stan.org/r-packages/> so that it can be resolved during checks.

All code paths that use 'cmdstanr', 'rstan', 'loo', 'bayesplot', 'MASS', and
'parallel' are guarded with `requireNamespace()` and are only reached when the
relevant package is installed. Examples that fit Stan models are wrapped in
`\dontrun{}` because they require an external Stan toolchain and take far longer
than the example time limit to compile and sample. Tests that fit Stan models
are skipped when no backend is available.

## Downstream dependencies

There are currently no downstream dependencies.
