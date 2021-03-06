% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlp_net.R
\name{mlp_net-manipulating-network-inputs}
\alias{mlp_expand_reorder_inputs}
\alias{mlp_net-manipulating-network-inputs}
\alias{mlp_rm_input_neurons}
\title{Manipulating network inputs}
\usage{
mlp_rm_input_neurons(net, report = FALSE)

mlp_expand_reorder_inputs(net, newnoinputs, inputsmap)
}
\arguments{
\item{net}{an object of \code{mlp_net} class}

\item{report}{logical value, if TRUE, information about removed neurons
will be printed on the console (FALSE by default)}

\item{newnoinputs}{integer value, determines the number of inputs in the new
network}

\item{inputsmap}{integer vector, determines the mapping of old inputs into
new ones - the ith value of this vector will be the new index
of ith input}
}
\value{
\code{mlp_rm_input_neurons} returns a two-element list. The first
        element (\code{net}) is the network (an object of \code{mlp_net}
        class) with all redundant input neurons removed, the second
        (\code{ind}) - the indices of input neurons that were not removed.

        \code{mlp_expand_reorder_inputs} returns an object of \code{mlp_net}
        class.
}
\description{
These functions construct new network by removing redundant (i.e. not connected
to the next layer) inputs or reordering / expanding network inputs.
}
\examples{

# construct a 2-4-3 network, plot result
nn <- mlp_net(c(2, 4, 3))
nn <- mlp_rnd_weights(nn)
mlp_plot(nn, TRUE)
# expand inputs, the new no. of inputs will be 5, with the first input
# becoming the 3rd and the second retaining its position, plot result
nn <- mlp_expand_reorder_inputs(nn, 5, c(3, 2))
mlp_plot(nn, TRUE)
# remove redundant neurons (i.e. 1, 4, 5) and plot result
nn <- mlp_rm_input_neurons(nn, TRUE)$net
mlp_plot(nn, TRUE)

}

