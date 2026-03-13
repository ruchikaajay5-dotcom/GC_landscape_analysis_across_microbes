echo "Mycobacterium tuberculosis sequences:"
grep "^>" ../data/mtub/mtub.fasta | wc -l

echo "Mycobacterium tuberculosis genome length:"
grep -v "^>" ../data/mtub/mtub.fasta | tr -d '\n' | wc -c

echo "Mycobacterium tuberculosis GC count:"
grep -v "^>" ../data/mtub/mtub.fasta | grep -o "[GC]" | wc -l
