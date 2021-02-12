library(ggplot2)

shinyUI(
  fluidPage(# TIPO DE PÁGINA
    titlePanel("😀 BIENVENIDO 😀"),
    sidebarLayout(
      sidebarPanel(
            selectInput("atributo1",# PONGO EL NOMBRE QUE QUIERO PERO QEU SEA IDENTIFICABLE
                      label = "Seleccione una variable",# NOMBRE CON EL QUE APARECERÁ EN LA APP
                      choices = c('Cilindros'='cyl','Consumo (mpg)'='hwy','Cilindrada'='displ',"Año"="year")),# CAMBIO EL NOMBRE LAS VARIABLES QUE ESTÁN COMO OPCIÓN EN EL SELECTINPU
            selectInput("atributo2",# PONGO EL NOMBRE QUE QUIERO PERO QEU SEA IDENTIFICABLE
                      label = "Seleccione una variable",# NOMBRE CON EL QUE APARECERÁ EN LA APP
                      choices = c('Cilindros'='cyl','Consumo (mpg)'='hwy','Cilindrada'='displ',"Año"="year")),
            
            sliderInput('sampleSize',#
                         'Seleccione una muestra', 
                         min = 2, #MINIMO VALOR DE LA MUESTRA
                         max= nrow(mpg), # EL MAXIMO COINCIDE CON LA LONGUITUD
                         value=10), # VLAOR POR DEFECTO
          
            actionButton("update",
                         label = "Calcular") # BOTON PARA HACER EL ISOLATE
        
                ),
                mainPanel( # CON ESTAS FUNCIONES CONECTAMOS EL INPUT CON EL OUTPUT (UI Y SERVER)
                          verbatimTextOutput("correlacion"),
                          plotOutput("grafico"),
                          plotOutput("hist_1"),
                          verbatimTextOutput("summary_1"),
                          plotOutput("hist_2"),
                          verbatimTextOutput("summary_2")
          )
        )
      )
    )