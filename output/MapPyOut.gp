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

load '../gnbu.pal'
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
M1=1.989E30
M2=1.898E27
xA=-1.06709
xB=-0.934312
xC=0.987421

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

d=0.02

set xrange [xA-d:xA+d]
set yrange [-d:d]

set contour base
set cntrparam levels incremental -1.78,0.0005,0



splot f(x,y) t 'V'

######################################P2#############################################

set title 'P2'

d=0.05

set xrange [xB-d:xB+d]
set yrange [-d:d]

set contour base
set cntrparam levels incremental -3,0.001,0

splot f(x,y) t 'V'

######################################P3#############################################

set title 'P3'

set xrange [xC-d:xC+d]
set yrange [-d:d]

set contour base
set cntrparam levels incremental -2,0.0009,0
splot f(x,y) t 'V'

######################################P4 y P5#############################################

set title 'P4 y P5'

d=0.004

set xrange [p-d:p+d]
set yrange [0.866-d:0.866+d]

set contour base
set cntrparam levels incremental -1.5,0.000001,-1.49
splot f(x,y) t 'V'

unset multiplot