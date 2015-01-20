#ShinyDir <- "/Volumes/Data/E-courses/Johns\ Hopkins\ University\ Data\ Science/Developing\ Data\ Products/ShinyCourseProject/ui.R"
#Set the working directory in your computer
#setwd(ShinyDir)
library(shiny)

shinyUI(fluidPage(
        # Application title
        headerPanel("OmegaViewer"),
        
        sidebarPanel(
                # 

                sliderInput('Omega', 'Select cutoff omega value',value = 5, min = 0, max = 999, step = 0.5),
                # 
                numericInput('LOWER', "Select LOWER omega to define neutrally evolving genes",
                                  value = 0.5, min = 0.5, max = 1.5, step = 0.05),
                numericInput('UPPER', "Select UPPER omega to define neutrally evolving genes",
                             value = 1.5, min = 0.5, max = 1.5, step = 0.05),
                # 
                sliderInput('Bins', 'Number of bins',value = 50, min = 1, max = 100, step = 1),
                # Input path and name of the file containing the omega values
                fileInput('inputFile', 'Choose file with list of omega values separated by newlines (range: 0-999)', multiple = FALSE, accept = NULL),
                submitButton('Submit'),
                dateInput("date", "Date:"),
                helpText("The shiny application OmegaViewer examines the distribution of Omega values (dN/dS) from a file containing
                         a list of estimates of Omega values for groups of genes. A slider widget is used to select a Omega cutoff value
                         from a range (0-999). To define the range of Omega values to classify a particular family of genes as
                         evolving neutrally I used two input controls to enter LOWER and UPPER Omega values. 
                         An additional slider widget was used to define the number of bins used in the histogram. 
                         To upload the file containing the Omega values to be examined I created a file upload control. 
                         Once the previous values have been selected by the user a submit button sends the input data to the application. 
                         The application then returns the total number of genes below the Omega cutoff value selected, 
                         the number of genes classified as evolving under Negative, Neutral and Positive Selection, 
                         as well as an histogram representing the distribution of Omega values in hand. 
                         Find source code at https://github.com/.")
        ),
        
        mainPanel(
                #textOutput('documentationText'),
                h3('Your settings:'),
                h4('You entered the following Omega cutoff value:'),
                verbatimTextOutput("oOmega"),
                h4('You entered the following UPPER omega values to define neutrally evolving genes:'),
                verbatimTextOutput("oNeutralUPPER"),
                h4('You entered the following LOWER omega values to define neutrally evolving genes:'),
                verbatimTextOutput("oNeutralLOWER"),
                h4('You entered the following number of bins:'),
                verbatimTextOutput("oBins"),
                h4('Your input file is:'),
                verbatimTextOutput("oInputFile"),
                h4('Date:'),
                verbatimTextOutput("odate"),
                h3('\n'),
                h3('Your results:'),
                h4('Total number of genes below cutoff:'),
                verbatimTextOutput("oNumberGenes"),
                h4('Number of genes under Negative Selection:'),
                verbatimTextOutput("oNegative"),
                h4('Number of genes under Neutral Evolution:'),
                verbatimTextOutput("oNeutral"),
                h4('Number of genes under Positive Selection:'),
                verbatimTextOutput("oPositive"),
                h3('\n'),
                h3('Histogram:'),
                plotOutput("odistPlot")
        )
))