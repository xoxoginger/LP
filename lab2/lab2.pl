tezka(voron,voronov).
tezka(golub,golubev).
tezka(kanareika,kanareikin).
tezka(grach,grachev).
tezka(chaika,chaikin).
tezka(popugai,popugaev).
tezka(skvorec,skvorcov).
 
solve(Ans,VladelecSkvorca):- 
    Ans=[voronov/A,golubev/B,kanareikin/C,grachev/D,chaikin/E,popugaev/F,skvorcov/G],
	permutation([voron,golub,kanareika,grach,chaika,popugai,skvorec],[A,B,C,D,E,F,G]),
    A\=voron,B\=golub,C\=kanareika,D\=grach,E\=chaika,F\=popugai,G\=skvorec,
    Dark=[voron,grach,skvorec],
    member(VladelecVorona/voron,Ans),tezka(TezkaVV,VladelecVorona),not(member(TezkaVV,Dark)),
    member(VladelecGracha/grach,Ans),tezka(TezkaVG,VladelecGracha),not(member(TezkaVG,Dark)),
    member(VladelecSkvorca/skvorec,Ans),tezka(TezkaVS,VladelecSkvorca),not(member(TezkaVS,Dark)),
    not(tezka(A,golubev)),not(tezka(A,kanareikin)),
    B\=grach,C\=grach,
    VladelecGracha\=chaikin,
    (B=voron ; C=voron),
    tezka(D,VladelecKanareiki),member(VladelecKanareiki/kanareika,Ans),
    member(VladelecPopugaya/popugai,Ans),tezka(TezkaVP,VladelecPopugaya),
    member(VladelecTezkiVP/TezkaVP,Ans),tezka(TezkaVTVP,VladelecTezkiVP),
    member(voronov/TezkaVTVP,Ans).