% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fss_subset_score.R
\name{score_priority_subset}
\alias{score_priority_subset}
\title{Compute the highest scoring subset for aggregated data.}
\usage{
score_priority_subset(args, score_fun = poisson_score,
  priority_fun = poisson_priority)
}
\arguments{
\item{args}{A list of matrices:
   \describe{
     \item{counts}{Required. A matrix of counts. Rows indicate time, ordered 
                   from most recent to most distant. Columns indicate e.g. 
                   locations or data streams, enumerated from 1 and up.}
     \item{baselines}{Required. A matrix of expected counts. Dimensions are 
                      as for \code{counts}.}
     \item{penalties}{Optional. A matrix of penalty terms. Dimensions are as
                      for \code{counts}.}
     \item{...}{Optional. More matrices with parameters}
}}

\item{score_fun}{A function taking matrix arguments, all of the
same dimension, and returning a matrix or vector of that dimension. 
Suitable alternatives are \code{\link{poisson_score}}, 
\code{\link{gaussian_score}}.}

\item{priority_fun}{A function taking matrix arguments, all of the
same dimension, and returning a matrix or vector of that dimension. 
Suitable alternatives are \code{\link{poisson_priority}}, 
\code{\link{gaussian_priority}}.}
}
\value{
A list containing three elements:
   \describe{
     \item{score}{The highest score of all clusters.}
     \item{duration}{The duration of the score-maximizing cluster.}
     \item{subset}{An integer vector of the subset of e.g. locations or data
                   streams in the score-maximizing cluster.}
}
}
\description{
Given data that is aggregated over either locations or data streams, this
function finds the highest scoring subset of the remaining dimensions of the
data. For example, if the data has been aggregated over data streams, the
highest scoring subset will consist of a window of time stretching from the
most recent time period to some time period in the past (i.e. a 
\emph{duration}) and a collection of locations.
}
\details{
This function provides the main component of the \emph{FN} and 
   \emph{NF} algorithms described in Section 3.1 of Neill et al. (2013).
}
\references{
Neill, Daniel B., Edward McFowland, and Huanian Zheng (2013). \emph{Fast 
   subset scan for multivariate event detection}. Statistics in Medicine 
   32 (13), pp. 2185-2208.
}
\keyword{internal}
