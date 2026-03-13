library(Biostrings)

# Load E coli genome
genome_ecoli <- readDNAStringSet("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/ecoli/ecoli.fasta")

seq <- genome_ecoli[[1]]
length(seq)

# Window size
window <- 1000

# Window start positions
starts <- seq(1, length(seq) - window, by = window)

# Calculate GC content per window
gc_values <- sapply(starts, function(s) {
  
  fragment <- subseq(seq, start = s, width = window)
  
  freq <- letterFrequency(fragment, c("G","C"))
  
  sum(freq) / window
})

# Whole genome GC
gc_total <- letterFrequency(seq, c("G","C"))
gc_fraction <- sum(gc_total) / length(seq)

# Save plot
png("results/ecoli_gc_landscape.png", width = 1000, height = 800)

plot(gc_values, type = "l",
     xlab = "Genome window",
     ylab = "GC content",
     main = "GC Landscape of E coli genome")

abline(h = gc_fraction, col = "red")

dev.off()
dev.list()
