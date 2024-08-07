import os

os.system(f"cat {config['pop_index']} | awk '{{print $1}}' > 00-data/id.txt")

#######################################################################################
rule reheader:
	input:
		vcf = config['bcftools_merge']['output_dir']  + 'all_merged.vcf.gz',
		names = '00-data/id.txt'
	output:
		config['bfctools_reheader']['output_dir']  + 'all_merged_names.vcf.gz'
	shell:
		"bcftools reheader -s {input.names} -o {output} {input.vcf} && tabix {output}"