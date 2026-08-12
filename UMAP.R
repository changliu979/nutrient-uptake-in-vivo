# This code is written for readability rather than efficiency.

# UMAP 
# df contain:
#   FSC, SSC, APC, FITC, BV650, cell type and tissue location

rm(list=ls())
gc()

df1 <- df[,c('FSC.A','SSC.A','Comp.APC.A','Comp.FITC.A','Comp.BV650.A')]

df1 <- as.data.frame(lapply(df1, function(x) {
  (x - min(x)) / (max(x) - min(x))
}))


library(uwot)

set.seed(111)

umap_result <- umap(
  df1,
  n_neighbors = 30,
  min_dist = 0.9,
  n_components = 2,
  verbose = TRUE
)

df$u1=umap_result[,1]
df$u2=umap_result[,2]



