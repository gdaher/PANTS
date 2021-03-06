% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pants.R
\name{pants}
\alias{pants}
\title{Pathway Analysis via NeTwork Smoothing}
\usage{
pants(object, phenotype.v, contrast.v, Gmat, ker = NULL,
  score_fcn = identity, nperm = 10^4, ret.null.mats = FALSE,
  verbose = TRUE, alternative = c("two.sided", "less", "greater"),
  min.size = 0, seed = 0)
}
\arguments{
\item{object}{A matrix-like data object containing log-ratios or log-expression values for a
series of samples, with rows corresponding to features and columns to samples.}

\item{phenotype.v}{A vector of phenotypes of strings the same length as number of samples in \code{object}.
If the vector is named, the names must match the column names of \code{object}.}

\item{contrast.v}{A named vector of constrasts. The constrasts must refer to the phenotypes
in \code{phenotype.v}. Their order defines the order they are passed to \code{score_fcn}.}

\item{Gmat}{Binary feature by pathway inclusion matrix, indicating which features are in which pathways.}

\item{ker}{Laplacian kernel matrix.}

\item{score_fcn}{A function that transforms the t-statistics from the contrasts. \code{identity} is 
the trivial identity function returning its argument. Its input must be a vector of same 
length as number of elements in \code{contrast.v}. Its output must be a scalar.}

\item{nperm}{Number of permutations to perform to evaluate significance of pathways.}

\item{ret.null.mats}{If TRUE, return matrices with null distributions for features and pathways.}

\item{verbose}{Logical indicating if the permutation number should be output every 500 permutations.}

\item{alternative}{A character string specifying the alternative hypothesis.}

\item{min.size}{Pathways with fewer than \code{min.size} measured features in \code{object} are filtered out.}

\item{seed}{Seed to set using \code{set.seed} for reproducibility.}
}
\value{
List of at least two dataframes:
\describe{
   \item{pwy.stats}{A dataframe with columns 
   \describe{
   \item{nfeatures}{number of features in the pathway} 
   \item{feat.score.avg}{sum of smoothed scores of the pathway's features / \code{nfeatures}. This score is compared
   to scores in permutations.}
   \item{z}{pathway permutation z-score (larger is more significant)}
   \item{p}{pathway permutation p-value} 
   \item{FDR}{pathway FDR calculated from p-values with \code{p.adjust(p, method='BH')}}
   }}
   \item{feature.stats}{A dataframe with columns
   \describe{
   \item{score}{feature's score from applying \code{score_fcn} in \code{\link{score_features}}}
   \item{z}{feature z-score (larger is more significant) relative to this feature's scores in permutation 
   (without smoothing)} 
   \item{p}{feature's permutation p-value} 
   \code{FDR}{feature's FDR from permutation \code{p}}
   }}
   And if \code{ret.null.mats} is TRUE:
   \item{null.feature.mat}{Matrix with features as rows and permutations as columns, where each element represents
   the score of that feature in that permutation}
   \item{null.pwy.mat}{Matrix with pathways as rows and permutations as columns, where each element represents
   the score of that pathway in that permutation}
 }
}
\description{
This is the main function of the \code{PANTS} package, which implements the PANTS algorithm
of Pathway Analysis (and optionally integration) via Network Smoothing for group contrasts.
}
\details{
Scores for features in the kernel but not in the data are assigned a value of zero by default for sparsity.
Scores for features and pathways are compared to null scores, which are generated by permuting the phenotypes and 
rerunning the algorithm.
}
