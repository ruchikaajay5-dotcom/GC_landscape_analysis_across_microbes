# GC Landscape Analysis Across Microbial Genomes


## About the project:
This project explores how **GC content varies across bacterial genomes**, it examines **how GC content changes across different regions of the genome** by using **GC landscape analysis**.

---

## Aim:
How does **GC content vary across the genomes of different bacteria**, and how do these organisms compare?

The organisms analyzed:
* *Escherichia coli*   - AT-rich genome               
* *Helicobacter pylori* - Moderate GC 
* *Mycobacterium tuberculosis* - GC-rich genome    
* *Streptomyces coelicolor* - Extremely GC-rich genome 

These bacteria were chosen because they vary in GC content.

---

## Data Source

Complete Genome sequences were downloaded from **NCBI** in FASTA format.

---

## Computational Approach

The genome sequence count, genome length and GC count was determined in the operating system **Ubuntu (Linux)**.
The analysis was performed in **R** using the **Biostrings** package.
---

## Outputs

The analysis generates two types of plots.

### 1. GC Landscape

A **line plot** showing GC content across genome windows.

* X-axis: genome windows
* Y-axis: GC fraction

A **red line** indicates the average GC content of the entire genome.

These plots are saved in:

```
results/
```

Example outputs:

* `ecoli_gc_landscape.png`
* `hpylori_gc_landscape.png`
* `mtub_gc_landscape.png`
* `scoelicolor_gc_landscape.png`

---

### 2. GC Distribution

Histograms showing the **distribution of GC content across windows**.

This helps visualize:

* how variable GC content is
* whether the genome has uniform or heterogeneous regions

---

## Key Observations

From the analysis:

* **Helicobacter pylori** shows low GC content (~38%)
* **E. coli** shows moderate GC (~50%)
* **Mycobacterium tuberculosis** is GC rich (~65%)
* **Streptomyces coelicolor** is extremely GC rich (~72%)

---

## Project Structure

```
GC_landscape_analysis_across_microbes
│
├── data
│   ├── ecoli
│   ├── helico
│   ├── mtub
│   └── scoeli
│
├── scripts
│   └── R scripts for GC analysis
│
├── results
│   └── GC landscape plots
│
└── README.md
```

---

## Tools Used

* **R**
* **Biostrings**
* Base R plotting

---

## Learning Goals

This project was created while transitioning from **wet-lab molecular biology to computational genomics**.

Skills practiced:

* working with genome FASTA files
* basic sequence analysis in R
* sliding window analysis
* visualizing genomic patterns

---

## Possible Extensions

Future improvements could include:

* comparing GC landscapes across more bacteria
* linking GC regions with **gene density**
* identifying **genomic islands**
* evolutionary comparison of GC bias
