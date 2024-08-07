#######################################################################################
rule piawka_agg_dxy:
	input:
		config['piawka']['output_dir']  + 'piawka_pi_dxy_fst.tsv'		
	output:
		config['piawka_agg']['output_dir']  + 'genomic_dxy_matrix.tsv',
		config['piawka_agg']['output_dir']  + 'genomic_dxy_table.tsv',
		config['piawka_agg']['output_dir']  + 'genomic_fst_matrix.tsv',
		config['piawka_agg']['output_dir']  + 'genomic_fst_table.tsv',
		config['piawka_agg']['output_dir']  + 'genomic_pi_table.tsv'
	log:
		config['piawka_agg']['logs'] + 'pi_dxy.log'
	shell:
		'python scripts/02-genomic_piawka_pi_dxy_fst.py {input} 2>{log}'

#######################################################################################
rule piawka_agg_het:
	input:
		config['piawka']['output_dir']  + 'piawka_het.tsv'
	output:
		config['piawka_agg']['output_dir']  + 'genomic_het_table.tsv'
	log:
		config['piawka_agg']['logs'] + 'het.log'
	shell:
		'python scripts/03-genomic_piawka_het.py {input} 2>{log}'	