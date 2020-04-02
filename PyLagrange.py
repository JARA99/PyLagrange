import os
import subprocess
import PyGnuplot as gp
import time

##################################################################################################################################################

M1=str(input('Masa del primer objeto: '))
M2=str(input('Masa del segundo objeto: '))
color=str(input('Color: [v]erde, [r]ojo, [a]zul:'))

if color=='v':
    chcolor='ylgn'
    chline=str(2)
elif color=='r':
    chcolor='ylorbr'
    chline=str(4)
elif color=='a':
    chcolor='gnbu'
    chline=str(3)
else:
    chcolor='ylorbr'
    chline=str(4)


###keywords para cambiar en el doc
kw1='inputM1\n'
kw2='inputM2\n'
kwCline='Cline\n'

###abrir doc original, crear uno a partir de este
XZinput=open("2D.gp","r")
XZoutput=open("output/2DPyOut.gp","w")

#guardar el documento como lista de strings
XZstrList=XZinput.readlines()

#leer lista y remplazar los valores donde hay keywords
for i in range(len(XZstrList)):
    if kw1 == XZstrList[i]:
        XZstrList[i]=str('M1='+M1+'\n')
    if kw2 == XZstrList[i]:
        XZstrList[i]=str('M2='+M2+'\n')
    if kwCline == XZstrList[i]:
        XZstrList[i]=str('plot f(x) t \'V\' ls '+chline+'\n')
    if i!=2 and i!=3:
        gp.c(XZstrList[i])

##crear el documento nuevo y cerrar ambos
XZoutput.writelines(XZstrList)
XZinput.close()
XZoutput.close()

time.sleep(0.5)

print('De la gráfica localice los tres máximos y computelos: \n')

xA=(str(input('Posición x del primer máximo: ')))
xB=(str(input('Posición x del segundo máximo: ')))
xC=(str(input('Posición x del tercer máximo: ')))

#keywords
kwA='inputxA\n'
kwB='inputxB\n'
kwC='inputxC\n'
kwColor='Cpalette\n'


###abrir doc original, crear uno a partir de este
Dinput=open("Potencial3DconVerticales.gp","r")
Doutput=open("output/3DPyOut.gp","w")

#guardar el documento como lista de strings
DstrList=Dinput.readlines()

#leer lista y remplazar los valores donde hay keywords
for i in range(len(DstrList)):
    if kw1 == DstrList[i]:
        DstrList[i]=str('M1='+M1+'\n')
    if kw2 == DstrList[i]:
        DstrList[i]=str('M2='+M2+'\n')
    if kwA == DstrList[i]:
        DstrList[i]=str('xA='+xA+'\n')
    if kwB == DstrList[i]:
        DstrList[i]=str('xB='+xB+'\n')
    if kwC == DstrList[i]:
        DstrList[i]=str('xC='+xC+'\n')
    if kwColor == DstrList[i]:
        DstrList[i]=str('load \'./gnuplot-palettes/'+chcolor+'.pal\''+'\n')

##crear el documento nuevo y cerrar ambos
Doutput.writelines(DstrList)
Dinput.close()
Doutput.close()

###abrir doc original, crear uno a partir de este
Mapinput=open("PotencialMap.gp","r")
Mapoutput=open("output/MapPyOut.gp","w")

#guardar el documento como lista de strings
MapstrList=Mapinput.readlines()

#leer lista y remplazar los valores donde hay keywords
for i in range(len(MapstrList)):
    if kw1 == MapstrList[i]:
        MapstrList[i]=str('M1='+M1+'\n')
    if kw2 == MapstrList[i]:
        MapstrList[i]=str('M2='+M2+'\n')
    if kwA == MapstrList[i]:
        MapstrList[i]=str('xA='+xA+'\n')
    if kwB == MapstrList[i]:
        MapstrList[i]=str('xB='+xB+'\n')
    if kwC == MapstrList[i]:
        MapstrList[i]=str('xC='+xC+'\n')
    if kwColor == MapstrList[i]:
        MapstrList[i]=str('load \'./gnuplot-palettes/'+chcolor+'.pal\''+'\n')

##crear el documento nuevo y cerrar ambos
Mapoutput.writelines(MapstrList)
Mapinput.close()
Mapoutput.close()


process1 = subprocess.Popen("cd output/ \n gnuplot 2DPyOut.gp 3DPyOut.gp MapPyOut.gp", shell = True)
os.waitpid(process1.pid, 0)
process2 = subprocess.Popen("cd output/ \n gthumb 2D.png", shell= True)
os.waitpid(process2.pid, 0)