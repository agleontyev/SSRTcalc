% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mean_adaptiveSSD.R
\name{mean_adaptiveSSD}
\alias{mean_adaptiveSSD}
\title{SSRT using mean method for studies with "adaptive" method of setting SSD}
\usage{
mean_adaptiveSSD(df, rt_col, ssd_col, stop_col)
}
\arguments{
\item{df}{Dataframe with response time, accuracy, indication whether trial is stop or go, and delays for a given trial.}

\item{rt_col}{Name of the column in the dataframe \code{df} that contains response time in seconds}

\item{ssd_col}{Name of the column in the dataframe \code{df} that contains stop-signal delays}

\item{stop_col}{Name of the column in the dataframe \code{df} that indicates whether a given trial is a "stop" or a "go" trial ( 0 = go, 1 = stop)}
}
\value{
Spline-interpolated stop-signal reaction time corresponding roughly to 50% inhibition accuracy.
}
\description{
Estimating SSRT using mean method for studies that use adaptive (increasing/decreasing by a given increment) stop-signal delays
}
\examples{
data(adaptive)
sapply(split(adaptive, adaptive$new_id), mean_adaptiveSSD, stop_col = 'vol',
ssd_col = 'soa', rt_col = 'RT_exp')
}
