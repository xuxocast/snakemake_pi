#######################################################################################
rule vcftools_filter:
	input:
		config['bcftools_call']['output_dir'] + '{xyz}.vcf.gz'
	output:
		config['vcftools_filter']['output_dir'] + '{xyz}.vcf.gz'
	log:
		config['vcftools_filter']['logs'] + '{xyz}.log'
	shell:
		"vcftools --gzvcf {input} --minDP 10 "
		"--minGQ 30 --max-missing-count 1 --remove-indels "
		"--recode --recode-INFO-all --stdout 2>{log} | "
		"gzip -c > {output} 2>>{log}"