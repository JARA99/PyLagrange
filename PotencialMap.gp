reset

set terminal pngcairo size 1000,750 font "Helvetica,16"
set output 'Map.png'

set multiplot layout 2,2 title "Puntos de Lagrange" font ",14"

#####################################################################################
###################################General###########################################
#####################################################################################

###################################Apariencia##########################################
set xtics rotate
set xlabel 'Desplazamiento en x' rotate by 0
set ylabel 'Desplazamiento en y' rotate by 90

Cpalette
set palette negative

set size ratio -1
set grid

set pm3d
set hidden3d
set isosamples 50
set view map
unset key
unset surface

###################################Variables#########################################
inputM1
inputM2
inputxA
inputxB
inputxC

d=0.07

x1=M2/(M2+M1)
x2=x1-1
p=(x1+x2)/2

###################################Funcion#########################################
f(x,y)=x2/sqrt((x-x1)**2+y**2)-x1/sqrt((x-x2)**2+y**2)-0.5*(x**2+y**2)

#####################################################################################
###################################Multiplots########################################
#####################################################################################

######################################P1#############################################

set title 'P1'

d=0.07

set xrange [xA-d:xA+d]
set yrange [-d:d]

li=x2/sqrt((xA-x1)**2+0**2)-x1/sqrt((xA-x2)**2+0**2)-0.5*(xA**2+0**2)

set contour base
set cntrparam levels incremental li-0.5,0.0005,li+0.5



splot f(x,y) t 'V'

######################################P2#############################################

set title 'P2'

d=0.07

set xrange [xB-d:xB+d]
set yrange [-d:d]

li=x2/sqrt((xB-x1)**2+0**2)-x1/sqrt((xB-x2)**2+0**2)-0.5*(xB**2+0**2)

set contour base
set cntrparam levels incremental li-0.5,0.009,li+0.5

splot f(x,y) t 'V'

######################################P3#############################################

set title 'P3'

d=0.07

set xrange [xC-d:xC+d]
set yrange [-d:d]

li=x2/sqrt((xC-x1)**2+0**2)-x1/sqrt((xC-x2)**2+0**2)-0.5*(xC**2+0**2)

set contour base
set cntrparam levels incremental li-0.5,0.0009,li+0.5
splot f(x,y) t 'V'

######################################P4 y P5#############################################

set title 'P4 y P5'

d=0.004

set xrange [p-d:p+d]
set yrange [0.866-d:0.866+d]

li=x2/sqrt((p-x1)**2+0.866**2)-x1/sqrt((p-x2)**2+0.866**2)-0.5*(p**2+0.866**2)

set contour base
set cntrparam levels incremental li-0.001,0.0000018,li+0.001
splot f(x,y) t 'V'

unset multiplot