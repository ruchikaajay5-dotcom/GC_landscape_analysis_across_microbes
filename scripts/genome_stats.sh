#!/bin/bash

# Genome statistics script
# Calculates sequence count, genome length, and GC count

echo "E coli sequences:"
grep "^>" ../data/ecoli/ecoli.fasta | wc -l

echo "E coli genome length:"
grep -v "^>" ../data/ecoli/ecoli.fasta | tr -d '\n' | wc -c

echo "E coli GC count:"
grep -v "^>" ../data/ecoli/ecoli.fasta | grep -o "[GC]" | wc -l




