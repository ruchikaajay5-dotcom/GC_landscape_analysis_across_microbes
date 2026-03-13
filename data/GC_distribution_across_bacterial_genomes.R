library(Biostrings)
library(ggplot2)
library(dplyr)
library(tidyr)

# Function to calculate GC content
calculate_gc <- function(fasta_file, window=10000){
  genome <- readDNAStringSet(fasta_file)
  seq <- genome[[1]]
  starts <- seq(1, length(seq)-window, by=window)
  gc_values <- sapply(starts, function(pos){
    fragment <- subseq(seq, start=pos, width=window)
    gc <- letterFrequency(fragment, c("G","C"))
    sum(gc)/window
  })
  return(gc_values)
}

# Compute GC vectors
gc_ecoli <- calculate_gc("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/ecoli/ecoli.fasta")
gc_hpylori <- calculate_gc("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/helico/helicobacter.fasta")
gc_mtub <- calculate_gc("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/mtub/mtub.fasta.fna")
gc_scoelicolor <- calculate_gc("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/scoeli/scoeli.fasta")

# Combine into a data frame
gc_df <- data.frame(
  GC = c(gc_ecoli, gc_hpylori, gc_mtub, gc_scoelicolor),
  Organism = factor(rep(c("E coli", "H pylori", "M tuberculosis", "S coelicolor"),
                        times = c(length(gc_ecoli), length(gc_hpylori),
                                  length(gc_mtub), length(gc_scoelicolor))))
)

# Plot using ggplot
p <- ggplot(gc_df, aes(x = GC, fill = Organism)) +
  geom_histogram(bins = 30, alpha = 0.6, position = "identity") +
  facet_wrap(~Organism, ncol = 2) +
  theme_minimal() +
  labs(title = "GC Distribution Across Bacterial Genomes",
       x = "GC Fraction",
       y = "Number of genome windows") +
  theme(legend.position = "none")

ggsave("results/gc_distribution_all_ggplot.png", plot = p,
       width = 10, height = 8, units = "in", dpi = 300)



summary(gc_ecoli)
summary(gc_hpylori)
summary(gc_mtub)
summary(gc_scoelicolor)