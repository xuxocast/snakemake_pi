# snakemake_pi
An Snakemake pipeline for unbiased population metrics


<img src="dag.svg " width="1000" height="750" />



Needs a mamba (or micromamba) previously instaled (refer to [mamba installation](https://github.com/conda-forge/miniforge)). Create the enviroment with:
```
mamba env create -f enviroment.yaml -n snakemake_pi
```

and activate the created enviroment with:
```
 mamba activate snakemake_pi
```

Once the enviroment its activated it is needed to populate the data folders with:

1.  reference genome 
2.  population index
3.  reads files (in *bam* format under the folder *00-reads/*)

Refefer to *config.yaml* to modify the filepaths and other pipeline options.

Run with:
```
snakemake -j {cores}
```