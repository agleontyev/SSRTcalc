## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
> On windows-x86_64-devel (r-devel), ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Anton Leontyev <a.g.leontiev@tamu.edu>'
  
  
  New submission
  Possibly mis-spelled words in DESCRIPTION:
    SSRT (3:13, 6:88)
    Verbruggen (6:267, 6:326)
    al (6:281, 6:340)
    et (6:278, 6:337)

## Re-submission notes

In the previous submission (v0.2.3), the following issues were raised:

> Please omit the redundant "in R" from title and description text.
   
Redundant text has been omitted.

> \dontrun{} should only be used if the example really cannot be executed
        (e.g. because of missing additional software, missing API keys, ...) by
        the user. That's why wrapping examples in \dontrun{} adds the comment
        ('# Not run:') as a warning for the user.
        Does not seem necessary.


> Please unwrap the examples if they are executable in < 5 sec, or create
      additionally small toy examples to allow automatic testing.
      You could also replace \dontrun{} with \donttest, if it takes longer
      than 5 sec to be executed, but it would be preferable to have automatic
      checks for functions. Otherwise, you can also write some tests.

I have included example data sets, so now the examples work with them.
