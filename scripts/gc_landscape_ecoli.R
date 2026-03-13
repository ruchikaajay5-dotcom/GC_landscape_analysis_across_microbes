library(Biostrings)

#load the Ecoli genome
genome_ecoli <- readDNAStringSet("../data/ecoli/ecoli.fasta")
head(genome_ecoli)

seq <- genome_ecoli[[1]]
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
     main="GC Landscape of E coli genome")
abline(h = gc_fraction, col="red")
png("results/ecoli_gc_landscape.png")
