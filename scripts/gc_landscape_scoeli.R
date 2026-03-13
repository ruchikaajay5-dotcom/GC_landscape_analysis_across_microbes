library(Biostrings)

#load the S coelicolor genome
genome_scoeli <- readDNAStringSet("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/scoeli/scoeli.fasta")
head(genome_scoeli)

seq <- genome_scoeli[[1]]
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

plot(gc_values, type="l",
     xlab="Genome window",
     ylab="GC content",
     main="GC Landscape of Streptomyces coelicolor genome")
abline(h = gc_fraction, col="red")
png("results/scoeli_gc_landscape.png")
