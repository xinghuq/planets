% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlp_net.R
\name{mlp_net-general-information}
\alias{mlp_get_layers}
\alias{mlp_get_no_active_w}
\alias{mlp_get_no_w}
\alias{mlp_net-general-information}
\title{General information about network}
\usage{
mlp_get_layers(net)

mlp_get_no_active_w(net)

mlp_get_no_w(net)
}
\arguments{
\item{net}{an object of \code{mlp_net} class}
}
\value{
\code{mlp_get_layers} returns an integer vector with numbers of neurons
        in consecutive layers.

        \code{mlp_get_no_active_w} returns the number of active weights (connections and biases).

        \code{mlp_get_no_w} returns the total number (including inactive) of weights
                   (connections and biases).
}
\description{
The following functions return basic information about the network.
}
\seealso{
\code{\link[=mlp_net-class]{mlp_net-class}} for details
         on internal network representation.
}

