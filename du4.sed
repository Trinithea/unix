#!/bin/sed -Enf
# OPTIONY
# E: rozsirene regexy
# n: nevypisuj pattern space, pokud ti to explicitne nereknu prikazem p
# f: sedovy skript je soubor

/[0-9][0-9]*( \+ |\+)[0-9][0-9]*/ {
h

:cele
{
s/([0-9][0-9]*)( \+ |\+)([0-9][0-9]*)/,\1 \3/

s/(.*)(,)([0-9]+ [0-9]+)(.*)/\2\3/
# zacatek nahrad carkou
:both
s/(,.*)([0-9])( .*)([0-9])/\2\4\1\3/
/,[0-9]+ [0-9]+/b both

:firstNot
s/(, .*)([0-9])/0\2\1/
/, [0-9]+/b firstNot;

:secNot
s/(,.*)([0-9])( )/\20\1\3/
/,[0-9]+ $/b secNot;

s/, //
s/([0-9][0-9])/,0\1:/
#TO SCITANI NEJAK OPAKOVAT
:soucet
{
:nula
s/(,.*)(0)(.*:)/\1\3/
/,[0-9]*0[0-9]*:/ b nula
:jedna
s/(,.*)(1)(.*:)/\1X\3/
/,[0-9]*1[0-9]*:/ b jedna
:dva
s/(,.*)(2)(.*:)/\1XX\3/
/,[0-9]*2[0-9]*:/ b dva
:tri
s/(,.*)(3)(.*:)/\1XXX\3/
/,[0-9]*3[0-9]*:/ b tri
:ctyry
s/(,.*)(4)(.*:)/\1XXXX\3/
/,[0-9]*4[0-9]*:/ b ctyry
:pet
s/(,.*)(5)(.*:)/\1XXXXX\3/
/,[0-9]*5[0-9]*:/ b pet
:sest
s/(,.*)(6)(.*:)/\1XXXXXX\3/
/,[0-9]*6[0-9]*:/ b sest
:sedm
s/(,.*)(7)(.*:)/\1XXXXXXX\3/
/,[0-9]*7[0-9]*:/ b sedm
:osm
s/(,.*)(8)(.*:)/\1XXXXXXXX\3/
/,[0-9]*8[0-9]*:/ b osm
:devet
s/(,.*)(9)(.*:)/\1XXXXXXXXX\3/
/,[0-9]*9[0-9]*:/ b devet
/XXXXXXXXXX:/ s/XXXXXXXXXX:/1:/
/X:/ s/(,.*)(:)/\10\2/
/,:/ s/(,)(:)/\10\2/
# u labelu se ta substituce provede jednou vzdycky, kvuli podmince to zacne delat dokola

#tady udelat prevedeni na zvysok
s/(,)(XXXXXXXXX)([0-1]:)/\19\3/
s/(,)(XXXXXXXX)([0-1]:)/\18\3/
s/(,)(XXXXXXX)([0-1]:)/\17\3/
s/(,)(XXXXXX)([0-1]:)/\16\3/
s/(,)(XXXXX)([0-1]:)/\15\3/
s/(,)(XXXX)([0-1]:)/\14\3/
s/(,)(XXX)([0-1]:)/\13\3/
s/(,)(XX)([0-1]:)/\12\3/
s/(,)(X)([0-1]:)/\11\3/
s/(,)([0-1]:)/\10\2/
s/(.*,)([0-9])([0-1])(:)([0-9][0-9])/\2\1\3\5\4/
s/(.*,)([0-9])([0-1])(:$)/\2\1\3\4/
s/(.*)(,)(1)(:$)/\3\1/
s/(.*)(,)(0:$)/\1/
}
/:/ b soucet
s/(.*)/\1,/

G
s/([0-9][0-9]*( \+ |\+)[0-9][0-9]*)/:\1/
s/([0-9][0-9]*)(,)(.*)(:)([0-9][0-9]*( \+ |\+)[0-9][0-9]*)/\3\1/
h
#mozna by tu melo bejt nejkay next, pokud procitam soubor
}
/[0-9][0-9]*( \+ |\+)[0-9][0-9]*/ b cele
s/\n//g
}
p

