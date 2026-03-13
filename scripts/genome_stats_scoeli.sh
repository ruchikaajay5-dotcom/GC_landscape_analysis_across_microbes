echo "Streptomyces coelicolor sequences:"
grep "^>" ../data/Scoeli/scoeli.fasta | wc -l

echo "Streptomyces coelicolor genome length:"
grep -v "^>" ../data/Scoeli/scoeli.fasta  | tr -d '\n' | wc -c

echo "Streptomyces coelicolor genome GC content:"
grep -v "^>" ../data/Scoeli/scoeli.fasta  | grep -o "[GC]" | wc -l
