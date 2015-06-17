library(shiny)

shinyUI(navbarPage("Fuel consumption prediction (miles per galon)",
        tabPanel("Prediction",
                        sidebarPanel(
                                helpText("Please input your car parameters here:"),
                                sliderInput('cyl', 'Number of cylinders:',   value=4,  min = 4,   max = 8,  step = 2),

                                sliderInput('disp', 'Displacement (cu.in.):', value=196.3, min = 71,  max = 472,  step=1),
                                numericInput('hp', 'Gross horsepower:',  123,  min = 52,  max = 335,  step = 1),
                                helpText("Min hp  52",  " max hp 335."),
                                sliderInput('wt', 'Weight (lb/1000):',   value=3.325,   min = 1.513,  max = 5.424, step=0.001),
                                radioButtons('am', 'Transmission:',   list("Automatic" = 0, "Manual" = 1)),
                                submitButton('Submit')
                        ),
                        mainPanel(
                              h3('Input values'),
                              helpText("Run this application by submitting  your values in the left panel.", "For more info, please check 'About' tab"),
                              h5('Number of cylinders:'),
                              verbatimTextOutput("cyl"),
                              h5('Displacement (cu.in.):'),
                              verbatimTextOutput("disp"),
                              h5('Gross horsepower:'),
                              verbatimTextOutput("hp"),
                              h5('Weight (lb/1000):'),
                              verbatimTextOutput("wt"),
                              h5('Transmission:'),
                              verbatimTextOutput("am"),
                              h3('Prediction'),
                              h4('Predicted fuel consumtion (ml/g):'),
                              verbatimTextOutput("pred")

                        )

                ),
         tabPanel("About",
                  helpText("You can get familliar with the mtcars data",
                                  " by exploring this table."),
                  dataTableOutput("table")
                  )
        )
)
