#ShinyDir <- "/Volumes/Data/E-courses/Johns\ Hopkins\ University\ Data\ Science/Developing\ Data\ Products/ShinyCourseProject/server.R"
#Set the working directory in your computer
#setwd(ShinyDir)
library(shiny)

shinyServer(
        function(input, output) {                
                observe({
                output$oid1 <- renderPrint({input$id1})
                output$oOmega <- renderPrint({input$Omega})
                output$oNeutralLOWER <- renderPrint({input$LOWER})
                output$oNeutralUPPER <- renderPrint({input$UPPER})
                output$oBins <- renderPrint({input$Bins})
                output$oInputFile <- renderPrint({input$inputFile})
                output$odate <- renderPrint({input$date})

                inFile <- input$inputFile                
                if (is.null(inFile))
                        return(NULL)               
                omegaVector <- as.numeric(readLines(inFile$datapath))
                
                cutoffomegaVector <- omegaVector[omegaVector <= input$Omega]
                numberofgenes <-length(cutoffomegaVector)
                numberofgenesNeg <-length(cutoffomegaVector[cutoffomegaVector < input$LOWER ])
                numberofgenesPos <-length(cutoffomegaVector[cutoffomegaVector > input$UPPER ])
                numberofgenesNeutral <-length(cutoffomegaVector[cutoffomegaVector > input$LOWER & cutoffomegaVector < input$UPPER ])
                output$oNumberGenes <- renderPrint({numberofgenes})                
                output$oNegative <- renderPrint({numberofgenesNeg})
                output$oPositive <- renderPrint({numberofgenesPos}) 
                output$oNeutral <- renderPrint({numberofgenesNeutral}) 
                output$odistPlot <- renderPlot({                      
                # draw the histogram with the specified number of bins                
                hist(cutoffomegaVector, breaks = input$Bins, col = 'darkgray', border = 'white', xlab = "Omega (dN/dS)",
                     main = "Histogram showing the distribution of omega values")})
                })
        }
)