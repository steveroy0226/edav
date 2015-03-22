---
title: "Graph Critique and Improvement: The Genographic Project"
author: "Robert Piccone"
output: html_document
layout: post
description: Graph Critique and Improvement blog post
tags: assignments
---

I recently submitted a DNA sample to National Geographic's Genographic Project. https://genographic.nationalgeographic.com/about/
The project mission is certainly a worthy one, but the results provided back to participants could use a little more detail and polish.

One of the charts The Genographic Project provides is your hominin ancestry - that is, the percentages of your DNA purported to be of Neanderthal and Denisovan origin respectively.

Here's how they depicted my non-Homo-Sapien-ness:

![Your Hominin Ancestry]({{ site.url }}/edav/assets/rap2186/piccone-bp1.png)

Where to begin on this?..

I find the varying blue/gray hues to be distractingly similar to each other, and to make matters worse, the hue of the stated percentage does not match its corresponding arc. 

The 3rd and outermost arc along with the text at the bottom would seem to depict 2.1% as the average amount of both Neanderthal and Denisovan DNA for all humans born outside of Africa.
The only problem is that those details are contradicted in the following "Explore Your Results" page (more on that to follow).

The use of a circle and arcs doesn't seem like the best way to convey this information, as it implies that the circle represents a maximum or total amount that holds some significance.
The surrounding arcs representing the percentages appear to be sized in relative proportion to each other, and they visually seem to make up about 75% of the circle. This would imply that the full circle represents a combined non-Homo-Sapien ancestry of around 7.6%.
After browsing the entire site, I did find some explanatory details on this page: https://genographic.nationalgeographic.com/v/#Hominin which states "you may find you have a small percentage (between 0 to 8 percent) of Neanderthal or Denisovan ancestry".
This at least explains the choice and the significance of the circle, but even if they were to include that detail on the same page as the graph (or at the very least link directly to it) I still don't think this is an effective data visualization. I have serious doubts that the purported upper limit of 8% is in any way meaningful, because
there is no information provided on the the standard deviation, sample size, or methodology used to come up with that figure. My assumption is that the 8% upper limit is a proverbial "black swan" - i.e. it is believed no living human would have a total above 8% because thus far, no human observed has come close to surpassing this amount.
It states explicitly in the linked "Explore Your Results" page that the science on this is very new, and that your results may change in the future as discoveries are made. This affirms my belief that displaying hominid percentages in the context of a circle representing 8% of the human genome is at worst misleading and at best irrelevant.

Moving on to the "Explore Your Results" page...

![Explore Your Results]({{ site.url }}/edav/assets/rap2186/piccone-bp2.png)

The text is interesting enough, but it states clearly that "Most non-Africans are about 2 percent Neanderthal and slightly less than 2 percent Denisovan". 
So why was the 2.1% arc double labelled as the average for both Neanderthal and Denisovan in the results chart? Is this supposed to be an "average of averages" or was it a flat-out error?

And once again, we see data being presented with circles that do not appear to convey any meaningful information. Why is the 1.9% circle larger than the 3.6% circle?

Following is an alternative data visualization I have come up with to address the issues I found to be problematic:

![Your Hominin Ancestry]({{ site.url }}/edav/assets/rap2186/hominin_dna_dv.png)

The outermost circle represents all of the participant's DNA, and it encompasses 2 inner circles representing their percentages of Denisovan and Neanderthal DNA. 
Both are labelled with their respective percentage values and sized so that their respective areas are proportional to each other and to the area of the outermost circle.
In other words, the circle representing 1.9% has an area equal to 1.9% of the outermost circle. The 2 inner circles will be enveloped within the outer circle up to a value of about 21%, which should be sufficient for everyone born in the last 20,000 years or so. :)

I created this graphic with ggplot2 in R markdown with this code:

