library(Biostrings)
helico_genome <- readDNAStringSet("../data/helico/helicobacter.fasta")
sequence <- helico_genome[[1]]

window <- 1000
starts <- seq(1, length(sequence)-window, by=window)
starts


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
png("../results/helico_gc_plot.png")
