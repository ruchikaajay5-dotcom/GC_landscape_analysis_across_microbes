library(Biostrings)
helico_genome <- readDNAStringSet("C:/Users/lenov/OneDrive/Desktop/genome-gc-landscape/data/helico/helicobacter.fasta")

sequence <- helico_genome[[1]]
length(sequence)

window <- 1000
starts <- seq(1, length(sequence)-window, by=window)


gc_values <- sapply(starts, function(s) {
  fragment <- subseq(sequence, start=s, width=window)
  freq <- letterFrequency(fragment, c("G","C"))
  sum(freq)/window
})


gc_total <- letterFrequency(sequence, c("G","C"))
gc_total
gc_fraction <- sum(gc_total) / length(sequence)
gc_fraction

plot(gc_values, type="l",
     xlab="Genome window",
     ylab="GC content",
     main="GC Landscape of Helicobacter pylori genome")
abline(h = gc_fraction, col="red")
png("results/helico_gc_landscape.png")

