tezka(voron,voronov).
tezka(golub,golubev).
tezka(kanareika,kanareikin).
tezka(grach,grachev).
tezka(chaika,chaikin).
tezka(popugai,popugaev).
tezka(skvorec,skvorcov).
 
 
 
solve(Ans,VladelecSkvorca):- Ans=[voronov/A,golubev/B,kanareikin/C,grachev/D,chaikin/E,popugaev/F,skvorcov/G],
    permutation([voron,golub,kanareika,grach,chaika,popugai,skvorec],[A,B,C,D,E,F,G]),
    A\=voron,B\=golub,C\=kanareika,D\=grach,E\=chaika,F\=popugai,G\=skvorec,
    %temnie - eto voron, grach i skvorec
    Temnie=[voron,grach,skvorec],
    member(VladelecVorona/voron,Ans),tezka(TezkaVV,VladelecVorona),not(member(TezkaVV,Temnie)),
    member(VladelecGracha/grach,Ans),tezka(TezkaVG,VladelecGracha),not(member(TezkaVG,Temnie)),
    member(VladelecSkvorca/skvorec,Ans),tezka(TezkaVS,VladelecSkvorca),not(member(TezkaVS,Temnie)),
    not(tezka(A,golubev)),not(tezka(A,kanareikin)),%tezka A zenat, a Golubev b Kanareikin holostyaki
    B\=grach,C\=grach,%hozyain gracha zenat
    VladelecGracha\=chaikin,%ne mozet bit zenat na sestre svoei zeni
    (B=voron ; C=voron),%raz u hozyaina vorona est nevesta, to eto kto-to iz nezenatih
    tezka(D,VladelecKanareiki),member(VladelecKanareiki/kanareika,Ans),%tezka ptici Gracheva - hozyain kanareiki
    member(VladelecPopugaya/popugai,Ans),tezka(TezkaVP,VladelecPopugaya),
    member(VladelecTezkiVP/TezkaVP,Ans),tezka(TezkaVTVP,VladelecTezkiVP),
    member(voronov/TezkaVTVP,Ans).%tezka, kotoraya yavleyaetsya...