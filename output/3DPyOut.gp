reset

set terminal pngcairo size 1000,750 font "Helvetica,16"
set output '3D.png'

###################################Apariencia##########################################
set xtics rotate
set xlabel 'Desplazamiento en x' rotate by 0
set ylabel 'Desplazamiento en y' rotate by 90

set loadpath '~/.config/Gnuplot/'
load './gnuplot-palettes/bupu.pal'
set palette negative

set style fill transparent solid 0.9
set size ratio -1

set pm3d
set hidden3d
set isosamples 50
set view 241,18
unset key
unset surface

###################################Variables#########################################
M1=25.786E24
M2=24.789E24
xA=-1.17191
xB=-0.025856
xC=1.14116

x1=M2/(M2+M1)
x2=x1-1
p=(x1+x2)/2

###################################Funcion#########################################
f(x,y)=x2/sqrt((x-x1)**2+y**2)-x1/sqrt((x-x2)**2+y**2)-0.5*(x**2+y**2)


set xrange [-2:2]
set yrange [-2:2]

set contour base
set cntrparam levels incremental -5,0.15,0


set arrow from xA,0,-1.5 to xA,0,-17.5 nohead dt 3 front
set arrow from xB,0,-1.5 to xB,0,-17.5 nohead dt 3 front
set arrow from xC,0,-1.5 to xC,0,-17.5 nohead dt 3 front
set arrow from p,0.866,-1.5 to p,0.866,-17.5 nohead dt 3 front
set arrow from p,-0.866,-1.5 to p,-0.866,-17.5 nohead dt 3 front

splot f(x,y) t 'V'