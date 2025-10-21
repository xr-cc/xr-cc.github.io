---
title: 'ML-MAGES: A machine learning framework for multivariate genetic association analyses with genes and effect size shrinkage'

# Authors
# If you created a profile for a user (e.g. the default `admin` user), write the username (folder name) here
# and it will be replaced with their full name and linked to their profile.
authors:
  - xliu
  - Lorin Crawford
  - Sohini Ramachandran

date: '2025-01-01'

# Schedule page publish date (NOT publication's date).
publishDate: '2017-01-01T00:00:00Z'

# Publication type.
# Accepts a single type but formatted as a YAML list (for Hugo requirements).
# Enter a publication type from the CSL standard.
publication_types: ['paper-conference']

# Publication name and optional abbreviated publication name.
publication: In *Research in Computational Molecular Biology*
publication_short: In *RECOMB*

abstract: A fundamental goal of genetics is to identify which and how genetic variants are associated with a trait, often using the regression summary statistics from genome-wide association (GWA) studies. Important methodological challenges are accounting for inflation in GWA effect estimates as well as investigating multiple traits simultaneously. We leverage machine learning approaches for these two challenges, developing a computationally efficient method called ML-MAGES. First, we shrink the inflation in GWA effect sizes caused by non-independence among variants using neural networks. We then cluster variant associations among multiple traits via variational inference. We compare the performance of neural network shrinkage to regularized regression and fine-mapping, which both address inflation but handle focal regions of different sizes. Our method outperforms those frameworks in approximating the true effects in simulated data. Our infinite mixture clustering approach offers a flexible, data-driven way to distinguish different types of associations—trait-specific, shared across traits, or spurious—among multiple traits based on their regularized effects. Clustering applied to our neural network shrinkage results also produces consistently higher precision and recall for distinguishing gene-level associations in simulations. We demonstrate the application of ML-MAGES on association analyses of two quantitative traits and two binary traits from the UK Biobank data. The identified genes from single-trait enrichment tests overlap with those having known relevant biological processes to the traits. Besides trait-specific associations, ML-MAGES identifies several variants with shared multi-trait associations, suggesting putative shared genetic architecture.

# # Summary. An optional shortened abstract.
# summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis posuere tellus ac convallis placerat. Proin tincidunt magna sed ex sollicitudin condimentum.

tags:
  - Machine Learning, Genetic Association, Complex Traits

# Display this page in the Featured widget?
featured: true

# Standard identifiers for auto-linking
hugoblox:
  ids:
    doi: 10.1007/978-3-031-90252-9_31

# # Custom links
# links:
#   - type: pdf
#     url: ""
#   - type: code
#     url: https://github.com/HugoBlox/hugo-blox-builder
#   - type: dataset
#     url: https://github.com/HugoBlox/hugo-blox-builder
#   - type: slides
#     url: https://www.slideshare.net/
#   - type: source
#     url: https://github.com/HugoBlox/hugo-blox-builder
#   - type: video
#     url: https://youtube.com

# # Featured image
# # To use, add an image named `featured.jpg/png` to your page's folder.
# image:
#   caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/pLCdAaMFLTE)'
#   focal_point: ''
#   preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects:
  - mlmages

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
