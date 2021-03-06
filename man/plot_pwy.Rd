% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_pwy.R
\name{plot_pwy}
\alias{plot_pwy}
\title{Plot network diagram for a pathway}
\usage{
plot_pwy(gr, ker, Gmat, pwy, score.v, annot = NA, ntop = 7,
  alternative = c("two.sided", "less", "greater"), name = NULL,
  color.pal = NULL, plot = TRUE, seed = 0)
}
\arguments{
\item{gr}{A graph of class \code{igraph} representing the interaction network. \code{is_simple(gr)} must be TRUE.}

\item{ker}{Kernel matrix, can be sparse matrix from package \code{Matrix}.}

\item{Gmat}{Pathway membership matrix, can be sparse matrix from package \code{Matrix}.}

\item{pwy}{Pathway to plot. Must be a column name of \code{Gmat}.}

\item{score.v}{Named vector of scores of features, where \code{names(score.v) == rownames(gr)}, to select top nodes 
and color them.}

\item{annot}{Named vector of annotations for nodes. If \code{annot} is given, \code{names(annot)} should 
have some overlap with \code{rownames(Gmat)}}

\item{ntop}{Number of top most significant features to include. If one of these is an external node, then its
internal neighbor nodes are also included. These nodes are then connected based on the interaction network.}

\item{alternative}{A character string specifying the alternative hypothesis.}

\item{name}{Name for PDF file to plot. Extension ".pdf" is added to the name. Set to \code{NA} to suppress writing to
file. If \code{NULL}, \code{name} is defined as \code{paste0(ezlimma::clean_filenames(pwy), '_ntop', ntop)}.}

\item{color.pal}{A color palette, as a vector. Must be accepted by \code{\link[igraph]{plot.igraph}}. If \code{NULL},
a palette from \code{\link[RColorBrewer]{brewer.pal}} appropriate to \code{alternative} is chosen.}

\item{seed}{Seed to set using \code{set.seed} for reproducibility of the graph layout.}
}
\value{
Invisibly, a list with components: 
 \describe{
   \item{gr}{the graph that gets plotted}
   \item{vertex.color}{the vertex colors}
   \item{vertex.size}{the vertex sizes}
   \item{score}{scores of the vertices of the plotted graph}
   \item{top.nodes}{ntop top nodes driving pathway}
}
}
\description{
Plot network diagram for a pathway with node size corresponding to significance and color to pathway membership.
}
