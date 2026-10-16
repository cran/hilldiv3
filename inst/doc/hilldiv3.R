## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)

## ----setup--------------------------------------------------------------------
library(hilldiv3)

## -----------------------------------------------------------------------------
counts <- matrix(
  c(10, 0, 5,
     2, 8, 1,
     3, 4, 0,
     6, 2, 7),
  nrow = 3, byrow = FALSE,
  dimnames = list(c("t1", "t2", "t3"),
                  c("s1", "s2", "s3", "s4"))
)
counts

## -----------------------------------------------------------------------------
hilldiv(counts)

## -----------------------------------------------------------------------------
tree <- ape::read.tree(text = "((t1:1,t2:1):1,t3:2);")
hilldiv(counts, tree = tree)                   # neutral + phylogenetic
hilldiv(counts, tree = tree, type = "phylogenetic")   # phylogenetic only

## -----------------------------------------------------------------------------
sets <- list(t1 = "t1", t1_and_t2 = c("t1", "t2"))
fdist <- as.matrix(stats::dist(c(t1 = 0, t2 = 0.5, t3 = 1)))
hillshare(counts[, "s2"], q = c(0, 1, 2),
          tree = tree, dist = fdist, sets = sets)

## -----------------------------------------------------------------------------
hillpart(counts)

## -----------------------------------------------------------------------------
hilldiss(counts, q = 1)

