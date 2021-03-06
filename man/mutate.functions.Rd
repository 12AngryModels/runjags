% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mutate.functions.R
\name{mutate.functions}
\alias{contrasts.MCMC}
\alias{contrasts.mcmc}
\alias{mutate.functions}
\alias{prec2sd}
\title{Mutate functions to be used with runjags summary methods}
\usage{
contrasts.mcmc(x, vars)

prec2sd(x, vars)
}
\arguments{
\item{x}{an object of class MCMC.}

\item{vars}{an optional character vector of variable names.  If supplied, only variable names in the object supplied with a partial match to anything in 'vars' will be used.  Note that regular expressions are not allowed, but the caret (^) token can be used to specify the match at the start of a variable name, and a quoted vars will be matched exactly.  Default NA meaning all variables available are returned.}
}
\value{
An MCMC object.
}
\description{
Objects of class \code{\link{runjags-class}} have specialised options available for print, plot and summary.  These methods allow a mutate function to be specified which produces additional variables based on the monitor variables.  These functions are examples of valid syntax, and may be useful in their own right.
}
\details{
The contrasts.mcmc and prec2sd functions are two common applications of the mutate argument to add.summary and \code{\link{run.jags}} and can be used as examples of the expected inputs and permitted return values.  They must take an MCMC object as input, and return an MCMC object or named list with the same length.
This can be used to add new variables to the posterior chains that are derived from the directly monitored variables in JAGS. This allows the variables to be summarised or extracted as part of the MCMC objects as if they had been calculated in JAGS, but without the computational or storage overheads associated with calculating them in JAGS directly.  The contrasts.mcmc and prec2sd functions are examples of valid objects (but both require an argument, so will have to be passed as e.g. mutate=list('contrasts.mcmc', 'variabletocontrast')).  See the mutate argument to \code{\link{add.summary}}.
}
\references{
Matthew J. Denwood (2016). runjags: An R Package Providing Interface Utilities, Model Templates, Parallel Computing Methods and Additional Distributions for MCMC Models in JAGS. Journal of Statistical Software, 71(9), 1-25. doi:10.18637/jss.v071.i09
}
\seealso{
\code{\link{add.summary}} for an applciation of these functions.
}
\keyword{methods}

