reset

set terminal pngcairo size 1000,750 font "Helvetica,16"
set output '2D.png'

###################################Variables#########################################
M1=1
M2=1

x1=M2/(M2+M1)
x2=x1-1

y=0

set xrange [-2:2]
set yrange [-5:0]

set xlabel 'Desplazamiento en x'
set ylabel 'Potencial'
set grid

f(x)=x2/sqrt((x-x1)**2+y**2)-x1/sqrt((x-x2)**2+y**2)-0.5*(x**2+y**2)

plot f(x) t 'V' ls 4

##