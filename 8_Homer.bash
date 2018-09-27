module load samtools/0.0.19
Module load homer/

makeTagDirectory CR1_1_120/ CR1.1_120.bam
makeTagDirectory CR1_150-500/ CR1.150_500.bam

makeUCSCfile CR1_1-120 -o auto
makeUCSCfile CR1_150-500 -o auto

annotatePeaks.pl /path_to/peak_file.txt mm10 -size 4000 -hist 20 -d /path_to/CR1_1-120/ > 1_120_graph.txt
annotatePeaks.pl /path_to/peak_file.txt mm10 -size 4000 -hist 20 -d /path_to/CR1_150-500/ > 150_500_graph.txt

annotatePeaks.pl /path_to/peak_file.txt mm10 -size 4000 -hist 20 -ghist -d /path_to/CR1_1-120/ > 1_120_heatmap.txt
annotatePeaks.pl /path_to/peak_file.txt mm10 -size 4000 -hist 20 -ghist -d /path_to/CR1_150-500/ > 150_500_heatmap.txt

findPeaks CR1_1-120/ -style factor -o auto -P 0.1 -poisson 0.01 -L 0 -i CR1noab_1-120/
findPeaks CR1_150-500/ -style factor -o auto -P 0.1 -poisson 0.01 -L 0 -i CR1noab_150-500/

annotatePeaks.pl CR1_1-120/peaks.txt mm10 > CR1_1-120/annotatedpeaks.txt
annotatePeaks.pl CR1_150-500/regions.txt mm10 > CR1_150-500/annotatedregions.txt

findMotifsGenome.pl /path_to/CR1_1-120/peaks.txt mm10 /path_to/CR1_1-120/ -size 200 -mask