% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RepRev.R
\name{repRev}
\alias{repRev}
\title{Continuous interactive session with rb.exe}
\usage{
repRev(
  path = revEnv$RevPath,
  useHistory = T,
  viewCode = F,
  coerce = F,
  use_wd = T,
  sleep = NULL
)
}
\arguments{
\item{path}{Path to rb.exe. Defaults to revEnv$RevPath, so
InitRev() must typically be called first.}

\item{useHistory}{Should rb input be saved to .Rhistory? If so, the up arrow key can be used
while repRev() is active to navigate previous inputs. Default is TRUE.}

\item{viewCode}{If TRUE, String-formatted code in the temporary file used to interact with
rb.exe will be displayed in the viewing pane. Default is FALSE.}

\item{coerce}{If FALSE, output from rb.exe will be returned in String format. If
TRUE, repRev() will attempt to coerce output into a suitable R object. Default is TRUE.}

\item{use_wd}{If T, temporary rb.exe session will use the same working directory as
the active R session. If F, it will use its default. Default is T.}

\item{sleep}{Integer. If a number of seconds are provided, Sys.sleep() will run after user
rb.exe input is provided for the given number of seconds. This will not occur if sleep is
NULL. This parameter was mostly made for testing purposes. Default is NULL.}
}
\description{
Allows user to continuously call rb.exe without having to retype function.
}
\details{
To exit session, type quit().

   clearRev() and getrRev() can be called from within session for ease of use.
}
\examples{
\dontrun{
repRev()

myNumber <- 4
myNumber

posteriorPredictiveProbability(v(2), 3)
getrRev()
clearRev()
quit()
}
}
