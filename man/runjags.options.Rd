\name{runjags.options}

\alias{runjags.options}
\alias{runJAGS.options}
\alias{runjags.getOption}
\alias{runJAGS.getOption}


\title{Options for the runjags package}

\description{

Utility function to change the default options for the runjags package.
Options will be used for all runjags function calls until the runjags
package is unloaded.  For a permanent solution, create a named list 
called '.runjags.options' containing the desired options in an R profile
file - on loading, runjags will check to see if this object exists in
the global environment and set the options automatically.
}

\usage{

	runjags.options(...)
	runjags.getOption(name)
	
}

\arguments{

\item{...}{named option(s) to change - for a list of available options,
see details below.}
\item{name}{the name of the option to get the current value of - for a 
list of available options, see details below.}

}

\details{
The following default options can be specified:

\itemize{
\item \bold{jagspath} - the path to JAGS to use unless over-ridden in a function call
(uses the findjags() function by default). 

\item \bold{method} - the runjags method to use unless over-ridden in a function call
(default is 'rjags' if the rjags package is installed, or 'interruptible'
otherwise).

\item \bold{tempdir} - default to temporary directory unless over-ridden in a
function call (default TRUE).

\item \bold{plot.layout} - the layout for plots unless over-ridden in a function
call. Must be a numeric vector of length 2.

\item \bold{new.windows} - use multiple windows for plots unless over-ridden in a
function call (default is platform dependent).

\item \bold{modules} - the modules to load unless over-ridden in a function call
(default none).

\item \bold{factories} - the factories to load unless over-ridden in a function call
(default none).

\item \bold{bg.alert} - an optional command to run once background JAGS processes have
completed. Note that this command is run on the command line via system(),
so will be system dependent. The default attempts to make an alert sound
using a system appropriate method, which may not work on all platforms.

\item \bold{linenumbers} - display line numbers when printing runjags model, data and
inits class objects unless over-ridden in a function call (default none).

\item \bold{inits.warning} - display warning messages about initial values being not
specified or re-used.

\item \bold{rng.warning} - display warning messages relating to pseudo-random number
generation for parallel chains.

\item \bold{summary.warning} - display a warning message if summary statistics are
requested for a small number of samples (and a few other similar situations).

\item \bold{blockcombine.warning} - display a warning message if multiple data or
inits blocks are combined in a model file.

\item \bold{blockignore.warning} - display a warning message if ignoring monitors,
data or inits in the model file because a character argument was given for the same
parameters to the run.jags function.

\item \bold{tempdir.warning} - display a warning message if tempdir=TRUE is requested
with a background method.

\item \bold{nodata.warning} - display a warning message if the model has been run
without any data.

\item \bold{adapt.incomplete} - all models are checked to make sure that the 
adaptive phase has completed - this option controls the behaviour of runjags if 
this adaptation is not complete before MCMC sampling. If adapt.incomplete='silent' 
no action is taken, if 'warning' then the model run is continued but a warning is 
given after the simulation is finished, and if 'error' an error will be returned. 
Note that for most methods the error is returned immediately following the 
adapt/burnin phases (so the sample iterations are not run), but for the simple 
and snow methods the full model will be run before the error is given.

\item \bold{repeatable.methods} - option to ensure that the MCMC object produced by
the rjags and rjparallel methods are identical to those produced by other 
methods (given the same starting values). This is primarily for extending 
compiled models, where additional burnin iterations will be done
to replace unnecessary adpative steps for consistency with other methods, and 
following dic sampling, where the rjags model will be reset to the state it was in 
before dic sampling.  Note that the precision of the numbers returned may differ 
between methods on some platforms.  

\item \bold{silent.jags} - suppress output of JAGS (or rjags) when updating models.

\item \bold{silent.runjags} - suppress feedback provided by the runjags functions.

\item \bold{predraw.plots} - automatically pre-calculate convergence diagnostic plots
(this will save time when displaying plots at the cost of increased
storage requirement for the runjags object).

\item \bold{force.summary} - override the default behaviour to omit calculation of
summary statistics for greater than 50 variables, and attempt to
calculate summary statistics anyway (this may cause long delays in
the processing of results).

\item \bold{mode.continuous} - calculate the mode of continuous variables for summary
statistics (requires the "modeest" package to be installed).

\item \bold{timeout.import} - the maximum number of seconds for runjags to wait for
coda files to finish being written before giving up. If a large
number of monitored variables are being written, either the timeout
can be increased or results.jags() can be used once the files have
been written.

\item \bold{partial.import} - force runjags to read in successful simulations even
when parallel simulations crashed. If this option is set to TRUE,
it is not guaranteed that a model result will contain the requested
number of chains!

\item \bold{keep.crashed.files} - allows folders containing crashed simulations to be
preserved even if keep.jags.files = FALSE. Any folders kept will be
deleted when runjags is unlaoded or when R quits.

\item \bold{full.cleanup} - when unloading the runjags package, should all simulation
folders preserved using keep.jags.files=TRUE be deleted?  This option
may not work as expected on all systems when quitting R, but should
always work for unloadNamespace('runjags').  Note also that folders
for any failed JAGS runs are *always* deleted on exit - if you want to
keep these, they will have to be copied manually.

\item \bold{debug} - display internal debugging output.

}

}

\value{

The current value of all available runjags options (after applying any
changes specified) is returned invisibly as a named list.

}


\seealso{

\code{\link{run.jags}},

\code{\link{findjags}},

\code{\link{runjags-class}}

}



\examples{

\dontrun{

# Create a list of options in the global environment (perhaps in an
# R startup profile file) BEFORE load()ing runjags:
.runjags.options <- list(inits.warning=FALSE, rng.warning=FALSE)
# Or if it is run in a different environment:
# .runjags.options <<- list(inits.warning=FALSE, rng.warning=FALSE)

# Then load runjags and verify that the options have been set:
library('runjags')
print(runjags.options())


# Change the default option to remove all feedback provided by
# runjags and JAGS/rjags (only errors will be printed to screen):
runjags.options(silent.jags=TRUE, silent.runjags=TRUE)

}

}

\keyword{methods}
