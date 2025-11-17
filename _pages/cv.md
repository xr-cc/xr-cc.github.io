---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Education
======
* Ph.D in Computational and Mathematical Engineering, Stanford University, 2023 
* M.S. in Computational and Mathematical Engineering, Stanford University, 2020 
* B.S. in Systems Science and Engineering, Washington University in St. Louis, 2018
* B.S. in Computer Science, Washington University in St. Louis, 2018

Work experience
======
* Oct 2023 - now: Postdoctoral Research Associate
  * Data Science Institute & Center for Computational Molecular Biology, Brown University, Providence, RI
  * Supervisor: Dr. Sohini Ramachandran
* June 2022 - Sep 2022: Data Scientist Intern
  * PayPal Global Data Science Group, San Jose, CA 

Publications
======
  <ul>{% for post in site.publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  
Talks
======
  <ul>{% for post in site.talks reversed %}
    {% include archive-single-talk-cv.html  %}
  {% endfor %}</ul>
  
Teaching
======
  <ul>{% for post in site.teaching reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  
Service and leadership
======
* Ambassador and Organizing Committee Member, Women in Data Science (WiDS) at Brown University 
* International Chair, Brown Postdoc Council
* Reviewer for multiple journals
