library(shiny)

countrylist_subset <- c("Austria","Belgium","China",
                        "Denmark","Finland","France",
                        "Germany","Greece","Indonesia",
                        "Ireland","Japan","Netherlands",
                        "Sweden","Switzerland",
                        "United Kingdom","United States")


countrylist <- c("World","Low income","Middle income","Lower middle income","Upper middle income",
                 "Low & middle income","East Asia & Pacific",
                 "Europe & Central Asia","Latin America & Caribbean",
                 "Middle East & North Africa","South Asia","Sub-Saharan Africa",
                 "Afghanistan","Albania","Algeria","American Samoa",
                 "Andorra","Angola","Antigua and Barbuda","Argentina",
                 "Armenia","Aruba","Australia","Austria","Azerbaijan",
                 "Bahamas, The","Bahrain","Bangladesh","Barbados",
                 "Belarus","Belgium","Belize","Benin","Bermuda",
                 "Bhutan","Bolivia","Bosnia and Herzegovina",
                 "Botswana","Brazil","Brunei Darussalam","Bulgaria",
                 "Burkina Faso","Burundi","Cambodia","Cameroon",
                 "Canada","Cabo Verde","Cayman Islands",
                 "Central African Republic","Chad","Channel Islands","Chile","China",
                 "Hong Kong SAR, China","Macao SAR, China","Colombia",
                 "Comoros","Congo, Dem. Rep.","Congo, Rep.","Costa Rica",
                 "Cote d'Ivoire","Croatia","Cuba","Curacao","Cyprus",
                 "Czech Republic","Denmark","Djibouti",
                 "Dominica","Dominican Republic","Ecuador","Egypt, Arab Rep.",
                 "El Salvador","Equatorial Guinea","Eritrea","Estonia",
                 "Ethiopia","Faeroe Islands","Fiji","Finland","France",
                 "French Polynesia","Gabon","Gambia, The","Georgia",
                 "Germany","Ghana","Greece","Greenland","Grenada",
                 "Guam","Guatemala","Guinea","Guinea-Bissau","Guyana",
                 "Haiti","Honduras","Hungary","Iceland","India","Indonesia",
                 "Iran, Islamic Rep.","Iraq","Ireland","Isle of Man",
                 "Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan",
                 "Kenya","Kiribati","Korea, Dem. Rep.","Korea, Rep.",
                 "Kosovo","Kuwait","Kyrgyz Republic","Lao PDR",
                 "Latvia","Lebanon","Lesotho","Liberia","Libya",
                 "Liechtenstein","Lithuania","Luxembourg","Macedonia, FYR",
                 "Madagascar","Malawi","Malaysia","Maldives","Mali",
                 "Malta","Marshall Islands","Mauritania","Mauritius",
                 "Mexico","Micronesia, Fed. Sts.","Moldova","Monaco",
                 "Mongolia","Montenegro","Morocco","Mozambique",
                 "Myanmar","Namibia","Nepal","Netherlands","New Caledonia",
                 "New Zealand","Nicaragua","Niger","Nigeria","Northern Mariana Islands",
                 "Norway","Oman","Pakistan","Palau","Panama",
                 "Papua New Guinea","Paraguay","Peru","Philippines",
                 "Poland","Portugal","Puerto Rico","Qatar","Romania",
                 "Russian Federation","Rwanda","Samoa","San Marino",
                 "Sao Tome and Principe","Saudi Arabia","Senegal",
                 "Serbia","Seychelles","Sierra Leone","Singapore",
                 "Sint Maarten (Dutch part)","Slovak Republic",
                 "Slovenia","Solomon Islands","Somalia","South Africa",
                 "South Sudan","Spain","Sri Lanka","St. Kitts and Nevis",
                 "St. Lucia","St. Martin (French part)",
                 "St. Vincent and the Grenadines","Sudan","Suriname","Swaziland",
                 "Sweden","Switzerland","Syrian Arab Republic","Tajikistan",
                 "Tanzania","Thailand","Timor-Leste","Togo","Tonga",
                 "Trinidad and Tobago","Tunisia","Turkey","Turkmenistan",
                 "Turks and Caicos Islands","Tuvalu","Uganda","Ukraine",
                 "United Arab Emirates","United Kingdom","United States",
                 "Uruguay","Uzbekistan","Vanuatu","Venezuela, RB",
                 "Vietnam","Virgin Islands (U.S.)","West Bank and Gaza",
                 "Yemen, Rep.","Zambia","Zimbabwe")



shinyUI(pageWithSidebar(
        headerPanel("World Development Indicators: Science and Technology"),
        sidebarPanel(
                
         
                
                selectInput('ipInput', '1. Select type of resource (x):', 
                            c("no_researchers_2005","no_technicians_2005","rd_expenditures_percent_gdp_2005","rd_expenditures_in_mdollars_2013")),  
                
                selectInput('ipOutput', '2. Select type of intellectual product (y):', c("no_journals_2011", "percent_of_manufactured_export_2013","ip_receipts_mdollar_2013","ip_payments_mdollar_2013","total_patent_resident_2013","total_patent_nonresident_2013","total_trademark_2013")),                
                selectInput('countryInput', '3. Select region/country:', countrylist, multiple = TRUE, selected = countrylist_subset)               
#                submitButton("Update Graph")                
                
        ),
        
        
        mainPanel(
              #  h4("Graph title"),
              #  code("some example code"),
                p("author: aamin"),
              p("This document presents the relationships between the various resources (people and capital) and the intellectual productivity of a country or region in the area of Science and Technology."),
              p("Follow the simple steps on the left side, and try out combinations for the different countries."),
                   
              plotOutput("graphResult"), 
              verbatimTextOutput("firstline"),
                p("Source: The World Bank."),
              a("World Development Indicators 2015, Last updated 04/14/2015",href="http://wdi.worldbank.org/table/5.13")
              


              
        )        
))