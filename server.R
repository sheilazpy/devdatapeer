data(mtcars)
lmfit <-lm(mpg~cyl+disp+hp+wt+am, data=mtcars)

shinyServer(
        function(input, output) {
                output$cyl <- renderPrint({input$cyl})
                output$disp <- renderPrint({input$disp})
                output$hp <- renderPrint({input$hp})
                output$wt <- renderPrint({input$wt})
                output$am <- renderPrint({
                        if(input$am == '1'){
                                'Manual'
                        }else{
                                'Automatic'
                        }})
                output$pred <- renderPrint({
                        new_data <-data.frame(
                                "cyl"=input$cyl,
                                "disp"=input$disp, 
                                "hp"=input$hp, 
                                "wt"=input$wt, 
                                "am"=as.numeric(input$am))
                        predict(lmfit, new_data)})
                output$table <- renderDataTable({
                        mtcars
                }, options=list(pageLength=10))
        }
)