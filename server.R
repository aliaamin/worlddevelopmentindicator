library(png) 
library(downloader)
library(dplyr)
library(plyr)
library(ggplot2)
library (gridExtra)
library(shiny)

shinyServer(function(input, output, session) {
        
        # load data and provide the correct format
        df <- read.csv("data/5.13_Science_and_technology.csv", na.strings = c(".."), header=TRUE,sep=",")

        df$country <- as.character(df$country)        
        df$no_researchers_2005 <- as.numeric(df$no_researchers_2005)
        df$no_technicians_2005 <- as.numeric(df$no_technicians_2005)
        df$no_journals_2011 <- as.numeric(df$no_journals_2011)
        df$rd_expenditures_percent_gdp_2005 <- as.numeric(df$rd_expenditures_percent_gdp_2005)
        df$rd_expenditures_in_mdollars_2013 <- as.numeric(df$rd_expenditures_in_mdollars_2013)
        df$percent_of_manufactured_export_2013 <- as.numeric(df$percent_of_manufactured_export_2013)
        df$ip_receipts_mdollar_2013 <- as.numeric(df$ip_receipts_mdollar_2013)
        df$ip_payments_mdollar_2013 <- as.numeric(df$ip_payments_mdollar_2013)
        df$total_patent_resident_2013 <- as.numeric(df$total_patent_resident_2013)
        df$total_patent_nonresident_2013 <- as.numeric(df$total_patent_nonresident_2013)
        df$total_trademark_2013 <- as.numeric(df$total_trademark_2013)
        
        
        # explanations of the variables to display
        
        output$firstline <- renderText(function() {
                
                
                if(input$ipInput == "no_researchers_2005") 
                { xtext <- " x: No of R&D Researchers per one million people"
                }        
                if(input$ipInput == "no_technicians_2005")
                { xtext <- " x: No of R&D Technicians per one million people"                
                }
                if(input$ipInput == "rd_expenditures_percent_gdp_2005")
                { xtext <- " x: Research and development expenditure (% of GDP) for public and private sector"                      
                }
                if(input$ipInput == "rd_expenditures_in_mdollars_2013")
                { xtext <- " x: Research and development expenditure (in millions US dollars) for public and private sector"                      
                }
                
                if(input$ipOutput == "no_journals_2011")
                { ytext <- "y: No of scientific and technical journal articles published based on data for 2011"                
                }        
                if(input$ipOutput == "percent_of_manufactured_export_2013")
                { ytext <- "y: High-technology exports (% of manufactured exports)"                
                }        
                if(input$ipOutput == "ip_receipts_mdollar_2013")
                { ytext <- "y: Charges for the use of intellectual property, receipts (BoP, current in million US$)"                
                }        
                if(input$ipOutput == "ip_payments_mdollar_2013")
                { ytext <- "y: Charges for the use of intellectual property, receipts (BoP, current in million US$)"                
                }        
                if(input$ipOutput == "total_patent_resident_2013")
                { ytext <- "y: Patent applications filed worldwide by residents"                
                }        
                if(input$ipOutput == "total_patent_nonresident_2013")
                { ytext <- "y: Patent applications filed worldwide by non-residents"                
                }        
                if(input$ipOutput == "total_trademark_2013")
                { ytext <- "y: Trademark applications filed are applications to register a trademark with a national or regional Intellectual Property (IP) office."                
                }        
                               
                paste(xtext, '\n', ytext)
                
        })
                

        # print the graph
        output$graphResult <- renderPlot({
                
                xi <- which( colnames(df)==input$ipInput )
                xii <- which( colnames(df)==input$ipOutput )
                           
                fractionData <- na.omit(select(df, country, xi, xii))
                fractionData <- subset(fractionData, country %in% input$countryInput) 
                p<-ggplot(data=fractionData, aes_string(x=input$ipInput, y=input$ipOutput))+labs(title = "World Development Indicators: Science and Technology")+geom_point(aes(colour=country), size=3)+geom_smooth(method='lm', formula=y~x)
                
                print(p)
                                    
                
        })



        
})

