# OIB validation [ENG]
Methods in various programming languages to validate Croatian identification number called OIB. More info on www.oib.hr.

# Provjera valjanosti OIB-a
Metode u različitim programskim jezicima za provjeru hrvatskog identifikacijskog broja zvanog OIB. 

# Što je OIB?

OIB je obavezan u poslovnoj korespodenciji od 1.1.2010. godine, a dodijeljen je privatnim i pravnim osobama te ima cilj zamijeniti JMBG odnosno MB.

U sve više projekata susrećemo se s potrebom za unosom ovog broja, a kako nismo uspjeli pronaći rješenje za njegovu validaciju, stvorili smo vlastitu funkciju za provjeru. Algoritam je vrlo jednostavan, no čemu da se sami mučite kad ga možete ovdje preuzeti besplatno. Provjera se temelji na standardu ISO7064, MOD 11,10.

# Objašnjenje

OIB mora imati 11 znamenaka s time da je zadnja znamenka kontrolna. OIB se provjerava na temelju te zadnje znamenke. S obzirom da se OIB dodjeljuje slučajnim odabirom prvih deset znamenaka, moguće je da sintaksa broja bude ispravna, no da broj nije dodjeljen niti jednoj pravnoj niti fizičkoj osobi.

Ukoliko netko ima volje napisati funkcije u drugim jezicima, slobodno dodajte.

Sve funkcije, servisi i objašnjenja su dana u najboljoj namjeri, no ne odgovaramo za eventualne probleme proizašle iz njihovog korištenja.

Više informacija o OIB-u možete pronaći na stranici www.oib.hr.

# Popis kontributora

Ova stranica je godinama bila smještena na www.dizzy.hr/oib, u listopadu 2013. je preseljena na blog domagoj.eu/oib, a sad je smještena tamo gdje i pripada - na GitHub. 

Osobe zaslužne za pojedine verzije su:
- ActionScript - Tomislav Pokrajcic, Binaria 
- ASP - Zvonimir Lokmer, Sinnoa 
- C - Damir Džeko, HZZO 
- C# - Domagoj Pavlešić, dizzy.hr 
- Clipper - Predrag Suvajdžić
- CPP/CLI - Mark Burazin, Tahoma
- Delphi/Pascal - Ivica Makaj, Victory 
- Excel - Marko Rakar, Mrak.org
- F# - Boris Ševo 
- Java - Jakov Kondža, Konit 
- JavaScript - Domagoj Pavlešić, dizzy.hr
- Objective C - Marjan Patača, info 
- Perl - Damir Džeko, HZZO 
- PHP - Zvonimir Lokmer, Sinnoa 
- PL/SQL - Robert
- Python - Željko Kutlić, 3 Ka d.o.o. 
- Ruby - Saša Jurić, Minus5 
- SQL - Marko Frntić, Monachus Informatika 
- Swift 4.2 - Tomislav Jakopec, FFOS
- VBA macro for Office - Damir Džeko, HZZO 
- Visual Basic - Toni Alfirević, Perpetuum Mobile 
