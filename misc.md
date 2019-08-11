
This tutorial will introduce you to basic steps of microbial community analysis. More importantly on how to look at your data and filter appropriately. We will use the [Human microbiome project phase I data](https://www.ncbi.nlm.nih.gov/pubmed/22699609).  

OTU or ASVs or sOTUs  

For past few years (maybe decade), identifying Operational taxonomic units (OTUs) from raw sequences used clustering approach. Using 97% identity cut-off was a standard approach and often closed reference OTU picking was accepted in the sicentific community. During the time of the development of tools and bioinformatics approaches this was possibly the best available method. However, as with many other fields of science, the knowledge has been updated. Evolution of bioinformatics approaches is a constant process. Based on current knowledge, the cons of 97% OTU picking stratergy (using clustering approaches) have out-weighed the pros (eg. less time).  

Recent approaches are now focused towards Amplicon Seuence Variants/sOTUs:  
* [Oligotyping](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3864673/)  
* [Deblur](http://dx.doi.org/10.1128/mSystems.00191-16)  
* [DADA2](https://www.nature.com/articles/nmeth.3869)  
* [NG-Tax](https://f1000research.com/articles/5-1791/v1)  

All above approaches have one common theme, they avoid 97% clustering and focus on minor differences (in many cases single nucleotide variations) to identify unique ASVs/sOTU.   

Note: Some how naming is different and variable. For this purpose and in this book, I will stick to ASVs when data from NG-tax is used.  

In this, section, we will compare outputs from 97% OTU picking approach and NG-tax approach.  
The data used here is the 16S rRNA gene variable region (V1-V3) for 97% OTU-pciking. The raw reads were processed using QIIME 1.9.1, SortMeRNA, and OTU picking was done using the closed-reference OTU-picking at 97% identity.   

For NG-Tax, we use the same raw data and processed through default settings.  

Here, we do not aim to bench mark. For this course, we aim to show differences between results from two approaches.  

For down stream analysis of *.biom files we use [Phyloseq](https://joey711.github.io/phyloseq/) and [microbiome](http://microbiome.github.io/microbiome/).    
Kindly cite all the packages and tools that were used in your analysis as listed at the end of each document in `sessionInfo`. Also make sure that you provide the workflow and scripts you used for analysis atleast as supplementary material with your research article.    
Check [Quick-R](http://www.statmethods.net/).  


Let us create few folders to organize the analysis. While this can be personal preference, make sure you write the structure to guide others who do not know your data well.  

```{r, eval=FALSE}

# Create Folders as following
# Tables
dir.create("tables")

# Figures
dir.create("figures")

# Phyloseq objects
dir.create("phyobjects")

# Custom codes/notes
dir.create("codes_notes")
```



**Load packages**  

```{r, warning=FALSE, message=FALSE}

library(microbiome) # data analysis and visualisation
library(phyloseq) # also the basis of data object. Data analysis and visualisation
library(microbiomeutilities) # some utility tools
library(RColorBrewer) # nice color options
library(ggpubr) # publication quality figures, based on ggplot2
library(DT) # interactive tables in html and markdown
library(data.table) # alternative to data.frame
library(dplyr) # data handling

```


 * Compositionality effect can also remarkably affect the reconstruction of taxonomic co-occurrence networks ([Friedman and Alm, 2012](https://www.ncbi.nlm.nih.gov/pubmed?Db=pubmed&Cmd=ShowDetailView&TermToSearch=23028285))

- [Signatures of ecological processes in microbial community time series. Faust K et al. Microbiome, 6(120) 2018]

- [Multi-stability and the origin of microbial community types. Faust et al. ISME Journal, 11:2159–2166, 2017]

- [Linking statistical and ecological theory: Hubbell’s unified neutral theory of biodiversity as a hierarchical Dirichlet process. Harris et al. Proceedings of the IEEE, 105(3):516–529, 2017]

- [Metagenomics meets time series analysis: unraveling microbial community dynamics. Faust K. Current Opinion in Microbiology, 25:56–66, 2015]

- [Microbial communities as dynamical systems. Gonze D et al. Current Opinion in Microbiology, 44:41–49, 2018]


