echo "H pylori sequences:"
grep "^>" ../data/helico/helicobacter.fasta | wc -l

echo "H pylori genome length:"
grep -v "^>" ../data/helico/helicobacter.fasta | tr -d '\n' | wc -c

echo "H pylori GC count:"
grep -v "^>" ../data/helico/helicobacter.fasta | grep -o "[GC]" | wc -l
