#serve.R

library(ggplot2)
library(shiny)

function(input ,output ) {  # FUNCION PARA CONECTAR EL USUARIO CON EL SERVIDOR
  muestra <- reactive({ # EL REACTIVO NOS PERMITE QEU CAMBIE CUANDO QUERAMOS (BOTON CALCULAR)
    input$update
    isolate(mpg[sample(nrow(mpg),size =  input$sampleSize),]) # CREAMOS LA MUESTRA CON EL INPUT QUE HAYA PUESTO EL USUARIO
                          })
                          
                          output$correlacion <- renderPrint({ # IMPRIME LA SALIDA DE LA CONSOLA
                            paste0("La correlación es: ", 
                                   cor(muestra()[[input$atributo1]], # EXTRAE DEL DATA SET DE MUESTRA LA VARIBLE ELEGIDA 
                                       muestra()[[input$atributo2]]))
                          })
                          
                          output$grafico <-  renderPlot({ #CREAC UN GRÁFICO
                            input$update # SE EJECUTA CADA VEZ QUE PULSAMOS "CALCULAR"
                               isolate(ggplot(muestra(), # ISOLATE _Ejecuta la expresión  donde se pueden leer los valores reactivos
                                              aes_string(x=input$atributo1, #PONE COMO X LA VARIABLE ELEGIDA
                                                         y=input$atributo2)) + 
                                         geom_point(size=2)+
                                         theme_minimal())
                          
                          })  
                            
                          output$hist_1 <- renderPlot({
                            input$update# SE EJECUTA CADA VEZ QUE PULSAMOS "CALCULAR"
                                isolate(hist(mpg[[input$atributo1]],
                                             main="Atributo 1",
                                             col="tomato",
                                             xlab=" ",
                                             border="black"))
                          })
                          
                          output$summary_1 <- renderPrint({
                            summary(muestra()[[input$atributo1]])# EXTRAE DEL DATA SET DE MUESTRA LA VARIBLE ELEGIDA 
                          })
                          
                          output$hist_2 <- renderPlot({
                            input$update# SE EJECUTA CADA VEZ QUE PULSAMOS "CALCULAR"
                                isolate(hist(mpg[[input$atributo2]],
                                             main="Atributo 2",
                                             xlab=" ",
                                             col="chocolate",
                                             border="black",))
                          })
                          
                          output$summary_2 <- renderPrint({
                            summary(muestra()[[input$atributo2]])# EXTRAE DEL DATA SET DE MUESTRA LA VARIBLE ELEGIDA 
                          })

  }
  

  
  
  
  
  
  
  
  
  
  
  