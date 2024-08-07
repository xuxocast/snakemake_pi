#######################################################################################
rule piawka_pi:
	input:
		bed = config['fasta2bed']['dir_stacks'] + 'catalog_sorted_merged.bed',
		vcf = config['bfctools_reheader']['output_dir']  + 'all_merged_names.vcf.gz',
		poi = config['pop_index']
	output:
		config['piawka']['output_dir']  + 'piawka_pi_dxy_fst.tsv'
	params:
		config['piawka']['script_dir']
	threads:
		config['piawka']['threads']
	log:
		config['piawka']['log_pi']
	shell:
		'export PATH="{params}:$PATH" && '
		'bash {params}piawka_par.sh -a "-j {threads}"  -b {input.bed} -g {input.poi} -v {input.vcf} '
		'-p "MULT=1 FST=1 DXY=1 PIXY=1 VERBOSE=1" 2>{log} 1>{output}'

#######################################################################################
rule piawka_het:
	input:
		bed = config['fasta2bed']['dir_stacks'] + 'catalog_sorted_merged.bed',
		vcf = config['bfctools_reheader']['output_dir']  + 'all_merged_names.vcf.gz',
		poi = config['pop_index']
	output:
		config['piawka']['output_dir']  + 'piawka_het.tsv'
	params:
		config['piawka']['script_dir']
	threads:
		config['piawka']['threads']
	log:
		config['piawka']['log_het']
	shell:
		'export PATH="{params}:$PATH" && '
		'bash {params}piawka_par.sh -a "-j {threads}"  -b {input.bed} -g {input.poi} -v {input.vcf} '
		'-p "HET=1 MULT=1 PIXY=1 VERBOSE=1" 2>{log} 1>{output}'