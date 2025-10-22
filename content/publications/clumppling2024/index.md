---
title: "Clumppling: cluster matching and permutation program with integer linear programming"
authors:
- xliu
- Naama Kopelman
- Noah Rosenberg
date: "2024-01-01"

# Schedule page publish date (NOT publication's date).
publishDate: "2017-01-01T00:00:00Z"

# Publication type.
# Accepts a single type but formatted as a YAML list (for Hugo requirements).
# Enter a publication type from the CSL standard.
publication_types: ["article-journal"]

# Publication name and optional abbreviated publication name.
publication: "*Bioinformatics*(40)"
publication_short: ""

abstract: "In the mixed-membership unsupervised clustering analyses commonly used in population genetics, multiple replicate data analyses can differ in their clustering solutions. Combinatorial algorithms assist in aligning clustering outputs from multiple replicates so that clustering solutions can be interpreted and combined across replicates. Although several algorithms have been introduced, challenges exist in achieving optimal alignments and performing alignments in reasonable computation time. We present *Clumppling*, a method for aligning replicate solutions in mixed-membership unsupervised clustering. The method uses integer linear programming for finding optimal alignments, embedding the cluster alignment problem in standard combinatorial optimization frameworks. In example analyses, we find that it achieves solutions with preferred values of a desired objective function relative to those achieved by *Pong* and that it proceeds with less computation time than *Clumpak*. It is also the first method to permit alignments across replicates with multiple arbitrary values of the number of clusters K."

# # Summary. An optional shortened abstract.
# summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis posuere tellus ac convallis placerat. Proin tincidunt magna sed ex sollicitudin condimentum.

tags:
- Population Structure, Clustering, Clustering Alignment
featured: true

hugoblox:
  ids:
    doi: 10.1093/bioinformatics/btad751

# links:
#   - type: pdf
#     url: http://arxiv.org/pdf/1512.04133v1
#   - type: code
#     url: https://github.com/HugoBlox/hugo-blox-builder
#   - type: dataset
#     url: ""
#   - type: poster
#     url: ""
#   - type: project
#     url: ""
#   - type: slides
#     url: https://www.slideshare.net/
#   - type: source
#     url: ""
#   - type: video
#     url: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
image:
  caption: 'Figure from Liu et al. 2024'
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects: []

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
