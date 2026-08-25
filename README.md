# Pangenome analysis workflows

Curated workflow scripts from the cluster `Ricepan` project directory.

Only representative scripts are included. Sample-specific copies and scripts
that repeat the same function were removed.

## Directories

| Directory | Function |
| --- | --- |
| `01_data_prep/` | FASTA header renaming |
| `02_alignment_sv/` | MUMmer, SV calling and SyRI |
| `03_synteny/` | BLAST, MCScanX, NGenomeSyn collinearity |
| `04_orthology/` | CD-HIT clustering and OrthoFinder |
| `05_pangenome/` | Cactus/minigraph/vg pangenome graph construction |
| `06_secondary_metabolism/` | antiSMASH |
| `07_functional_annotation/` | InterPro, KEGG, SwissProt, Trembl, KOG, NR, GO |
| `08_visualization/` | NGenomeSyn plots |
| `09_ka_ks/` | ParaAT and PAML/codeml Ka/Ks preparation |

## Privacy notes

- Absolute HPC paths, user names, project identifiers and internal sample names
  were replaced with placeholders such as `/DATA`, `/TOOLS`, `/PIPELINES`,
  `/DATABASES`, `USER`, `PROJECT`, and `SAMPLE`.
- Raw data, result tables, assemblies and attachments were not uploaded.

## License

See [LICENSE](LICENSE).
