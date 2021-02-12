# APP_practica_1

Realizar una aplicación shiny que usa sidebarLayout en la que aparezca:
- Dos selectores que permitan elegir cada uno una variable del dataset mpg (ver ayuda de mpg para saber qué variables contiene).
o Estos selectores deben mostrar al usuario un nombre de variable inteligible que describa la variable y no el nombre de la variable del dataset pero internamente su valor sí debe ser el nombre de la variable. Por ejemplo “cyl” no debería mostrarse al usuario sino “number of cylinders” o “número de cilindros”. Pero “cyl” si debería ser el valor del input para luego utilizarlo en los outputs correctamente.
- Campo numérico para elegir el tamaño de la submuestra a realizar. Su mínimo es 2 y su valor máximo es el número de registros del dataset. El valor por defecto debe ser 10.
- Un botón para accionar el análisis y que los resultados se actualicen
