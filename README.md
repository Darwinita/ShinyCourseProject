---
title: “OmegaViewer”
author: "Lorenzo Carretero-Paulet"
date: “January 19, 2014"
---
DEVELOPING DATA PRODUCTS COURSE PROJECT
===

INSTRUCTIONS: Your Shiny Application
---

Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
Deploy the application on Rstudio's shiny server
Share the application link by pasting it into the text box below
Share your server.R and ui.R code on github
The application must include the following:

Some form of input (widget: textbox, radio button, checkbox, ...)
Some operation on the ui input in sever.R
Some reactive output displayed as a result of server calculations
You must also include enough documentation so that a novice user could use your application.
The documentation should be at the Shiny website itself. Do not post to an external link.
The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame. 

OmegaViewer
---

**Introduction**

Selection may differentially act on nonsynonymous (amino acid-changing; dN)
substitutions compared to the putatively neutral synonymous (silent; dS) ones. Under the
neutral model of evolution, synonymous and non-synonymous substitutions accumulate
at the same rate (*Omega: ω ∼ 1*) . Conversely, deviations
from this pattern evidence the action of purifying or negative selection (purges deleterious mutations
to conserve the protein structure and function; *Omega: ω << 1*), or the action of Positive Selection
 promoting the fixation of non-synonymous mutations with advantageous fitness
effects (*Omega: ω > 1)*. Estimation of ω therefore yields insights on the molecular evolutionary
mechanisms of protein diversification and functional specialization. 

**Description**
I wrote the shiny application *OmegaViewer* to examine the distribution of Omega values (dN/dS) from a file containing a list of estimates of Omega values for groups of genes. I used a slider widget to select a Omega cutoff value from a range (0-999). To define the range of Omega values to classify a particular family of genes as evolving neutrally I used two input controls to enter LOWER and UPPER Omega values. An additional slider widget was used to define the number of bins used in the histogram. To upload the file containing the Omega values to be examined I created a file upload control. Once the previous values have been selected by the user a submit button sends the input data to the application. The application then returns the total number of genes below the Omega cutoff value selected, the number of genes classified as evolving under Negative, Neutral and Positive Selection, as well as an histogram representing the distribution of Omega values in hand. A omegas.list test file is provided.

**Intructions to visualize OmegaViewer**

Please, click [here](https://lcarretero.shinyapps.io/ShinyCourseProject/) to launch the application.

```
library(shiny)
runApp('ShinyCourseProject')
```