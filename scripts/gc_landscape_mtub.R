library(Biostrings)

genome_mtub <- readDNAStringSet("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/mtub/mtub.fasta.fna")
head(genome_mtub)

seq <- genome_mtub[[1]]
View(seq)
length(seq)

window <- 1000
starts <- seq(1, length(seq)-window, by=window)

gc_values <- sapply(starts, function(s) {
  fragment <- subseq(seq, start=s, width=window)
  freq <- letterFrequency(fragment, c("G","C"))
  sum(freq)/window
})

gc_total <- letterFrequency(seq, c("G","C"))
gc_total
gc_fraction <- sum(gc_total) / length(seq)
gc_fraction

png("results/mtub_gc_landscape.png", width = 1000, height = 800)

plot(gc_values, type = "l",
     xlab = "Genome window",
     ylab = "GC content",
     main = "GC Landscape of M tuberculosis genome")

abline(h = gc_fraction, col = "red")

dev.off()
dev.list()
