---
title: "Alignment of inferred latent ancestries in multiple population structure analysis results"
excerpt: "I tackle cluster misalignment in population structure inference, where the inferred latent ancestries (clusters) vary across runs and choices of number of clusters (<i>K></i>). I developed <i>Clumppling</i> to align multiple results, consolidate distinct solutions (modes), and clarify correspondence among inferred clusters. My tool visualizes the inferred population structure across K with multipartite graphs of bar plots and explicit alignment connections, enabling consistent, interpretable comparisons.<br/><img src='/images/projects/clumppling.png'
     alt='Clumppling'
     style='max-width:800px; width:100%; height:auto; display:block; margin:0 auto;'
     loading='lazy'>"
collection: portfolio
---

Check out *Clumppling* [here](https://github.com/PopGenClustering/Clumppling). This is a Python-based tool to perform clustering alignment. It can be installed as a Python package via ``pip install clumppling``.

Check out *KAlignedoscope* [here](https://github.com/ramachandran-lab/KAlignedoscope). This is an D3.js-based visualization tool built by *Avery Guo* (undergrad @ Brown) for interactively exploring and displaying aligned population structure analysis results. It can be installed as a Python package via ``pip install kalignedoscope``.

Also see [here](https://github.com/PopGenClustering/popstru-cls-align-vis-workflow) for a tutorial on the comprehensive workflow of performing population structure analysis end-to-end, from raw data preparation to creating publication-quality visualizations, using popular tools like *Structure* or *ADMIXTURE*, as well as our *Clumppling* and *KAlignedoscope* tools.

**Related work:** 
[Paper1]({{ "/publication/2024-01-01-clumppling2024" | relative_url }});
[Paper2]({{ "/publication/2025-12-31-kalignedoscope2025" | relative_url }})