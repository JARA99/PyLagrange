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

load '../ylgn.pal'
set palette negative

set size ratio -1
set grid

set pm3d
set hidden3d
set isosamples 50
set view map
unset key
unset surface


####################        Datos que puedes cambiar        #########################
###################################Variables#########################################
###Masas:
M1=1
M2=0.99999999999999999999
###Distancias en x de los primeros 3 puntos
xA=-1.2
xB=0
xC=1.2

###Detalle en curvas de nivel para los puntos P1, P2, P3 y P4
dP1=100#%
dP2=100#%
dP3=100#%
dP4=100#%

###Ampliacion en los puntos P1, P2, P3 y P4
aP1=100#%
aP2=100#%
aP3=100#%
aP4=100#%


#####################################################################################
#################################     Fin     #######################################

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

d=7.0000000000/aP1
ls=0.1000000000/dP1

set xrange [xA-d:xA+d]
set yrange [-d:d]

pli=f(xA,0)
mli=f(xA-d,0)
li=2*abs(pli-mli)

set contour base
set cntrparam levels incremental mli-li,ls,pli+li



splot f(x,y) t 'V'

######################################P2#############################################

set title 'P2'

d=7.0000000000/aP2
ls=0.9000000000/dP2

set xrange [xB-d:xB+d]
set yrange [-d:d]

pli=f(xB,0)
mli=f(xB-d,0)
li=2*abs(pli-mli)

set contour base
set cntrparam levels incremental mli-li,ls,pli+li

splot f(x,y) t 'V'

######################################P3#############################################

set title 'P3'

d=7.0000000000/aP3
ls=0.0900000000/dP3

set xrange [xC-d:xC+d]
set yrange [-d:d]

pli=f(xC,0)
mli=f(xC-d,0)
li=2*abs(pli-mli)

set contour base
set cntrparam levels incremental mli-li,ls,pli+li
splot f(x,y) t 'V'

######################################P4 y P5#############################################

set title 'P4 y P5'

d=0.4000000000/aP4
ls=0.0001800000/dP4

set xrange [p-d:p+d]
set yrange [0.866-d:0.866+d]

pli=f(p,0.866)
mli=f(p-d,0.866)
li=2*abs(pli-mli)

set contour base
set cntrparam levels incremental mli-li,ls,pli+li
splot f(x,y) t 'V'

unset multiplot