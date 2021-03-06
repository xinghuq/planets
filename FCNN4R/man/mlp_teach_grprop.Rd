% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlp_gteach.R
\name{mlp_teach_grprop}
\alias{mlp_teach_grprop}
\title{Rprop teaching - minimising arbitrary objective function}
\usage{
mlp_teach_grprop(net, obj_func, gradient, epochs, stop = NULL,
  report_freq = 0, report_action = NULL, u = 1.2, d = 0.5, gmax = 50,
  gmin = 1e-06)
}
\arguments{
\item{net}{an object of \code{mlp_net} class}

\item{obj_func}{function taking an object of \code{mlp_class} class
as a single argument returning objective to be minimised}

\item{gradient}{function taking an object of \code{mlp_class} class
as a single argument returning gradient of the objective}

\item{epochs}{integer value, number of epochs (iterations)}

\item{stop}{function (or NULL), a function taking objective history to date
and returning Boolean value (if TRUE is returned, algorithm stops)
(the default is not to stop until all iterations are performed)}

\item{report_freq}{integer value, progress report frequency, if set to 0
no information is printed on the console (this is the default)}

\item{report_action}{function (or NULL), additional action to be taken while
printing progress reports, this should be a function
taking network as a single argument (default NULL)}

\item{u}{numeric value, Rprop algorithm parameter (default 1.2)}

\item{d}{numeric value, Rprop algorithm parameter (default 0.5)}

\item{gmax}{numeric value, Rprop algorithm parameter (default 50)}

\item{gmin}{numeric value, Rprop algorithm parameter (default 1e-6)}
}
\value{
Two-element list, the first field (\code{net}) contains the trained network,
        the second (\code{obj}) - the learning history (value of the objective
        function in consecutive epochs).
}
\description{
This implementation (`generalisation') of the Rprop algorithm allows users to teach
network to minimise arbitrary objective function provided that functions
evaluating objective and computing gradient are provided.
}
\examples{
\dontrun{
# set up XOR problem
inp <- c(0, 0, 1, 1, 0, 1, 0, 1)
dim(inp) <- c(4, 2)
outp <- c(0, 1, 1, 0)
dim(outp) <- c(4, 1)
# objective
obj <- function(net)
{
    return(mlp_mse(net, inp, outp))
}
# gradient
grad <- function(net)
{
    return(mlp_grad(net, inp, outp)$grad)
}
# stopping citerion
tol <- function(oh) {
    if (oh[length(oh)] <= 5e-5) { return(TRUE); }
    return(FALSE)
}
# create a 2-6-1 network
net <- mlp_net(c(2, 6, 1))
# set activation function in all layers
net <- mlp_set_activation(net, layer = "a", "sigmoid")
# randomise weights
net <- mlp_rnd_weights(net)
# teach
netobj <- mlp_teach_grprop(net, obj, grad, epochs = 500,
                           stop = tol,
                           report_freq = 1)
# plot learning history
plot(netobj$obj, type = 'l')
}

}
\references{
M. Riedmiller. \emph{Rprop - Description and Implementation Details: Technical Report.} Inst. f.
Logik, Komplexitat u. Deduktionssysteme, 1994.
}
\keyword{teaching}

