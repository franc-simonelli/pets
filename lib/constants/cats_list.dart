// ignore_for_file: non_constant_identifier_names, unnecessary_string_escapes

import 'package:petsguide/model/cat_model.dart';

List INDEXPELO = [
  {'id': 0, 'mantello': 'Pelo corto'},
  {'id': 1, 'mantello': 'Pelo medio'},
  {'id': 2, 'mantello': 'Pelo lungo'},
  {'id': 3, 'mantello': 'Senza pelo'},
];

List<Cats> CATLIST = [
  // contents/images/bengala.png
  // https://media-assets.vanityfair.it/photos/6365371c142916e5bfd78e12/2:3/w_2945,h_4418,c_limit/GettyImages-1211812040.jpg
  
  // Cats(
  //   id: '1',
  //   razza: 'Bengala',
  //   descrizione: "Il gatto del Bengala è un gatto grande, elegante e molto muscoloso con una coda spessa che viene portata bassa. L'aspetto selvaggio del gatto del Bengala è esaltato dal suo caratteristico mantello dall'aspetto folto e sfarzoso e che può essere maculato o marmorizzato. La testa larga ha orecchie piccole e baffi pronunciati con gli occhi orlati di nero e di forma a mandorla. La coda è spessa e affusolata fino alla punta che è nera. La particolarità unica di questa razza è il caratteristico mantello dall'effetto dorato\perlato che è possibile trovare su alcuni esemplari, così come il loro notevole livello di attività, che può renderli più impegnativi rispetto ad altre razze.", 
  //   image: 'https://firebasestorage.googleapis.com/v0/b/catsapp-2848f.appspot.com/o/bengala.png?alt=media', 
  //   imageCarousel: 'https://static.kodami.it/wp-content/uploads/sites/31/2021/02/iStock-645923612-1200x675.jpg',
  //   origine: "Il gatto del Bengala deriva il suo nome dal nome latino del suo antenato selvatico, Felis engalensis (leopardo asiatico). L'obiettivo nello sviluppo della razza di gatto domestico del Bengala era quello di preservare una forte somiglianza fisica con il suo bellissimo antenato selvatico e, allo stesso tempo, la razza domestica è stata progettata anche per rivestire il ruolo di piacevole ed affidabile compagno di famiglia. I gatti del Bengala sono ora classificati come la quinta razza più popolare nel Regno Unito.",
  //   personalita: "I gatti del Bengala sono naturalmente predisposti ad essere una razza affettuosa. Hanno un indole estremamente energica e giocosa, sono intelligenti e sembrano guardare tutto ciò che li circonda domandandosi: 'si può giocare con questo?' Sono agili, amano arrampicarsi e possono essere vocali con una voce distintiva che è stata descritta come un tubare o cinguettio, o come uno strano suono ghiaioso. I gatti del Bengala sono una razza molto vocale e hanno un ampio vocabolario che a volte può essere abbastanza stridente, specialmente in situazioni non familiari. Hanno bisogno di compagnia durante il giorno per evitare la noia, così come l'opportunità di arrampicarsi e simulare la caccia.",
  //   paese: 'USA', 
  //   mantello: 'Pelo corto', 
  //   taglia: 'Media', 
  //   vita: '12-16 anni', 
  //   carattere: 'Fiducioso, Socievole, Vocalmente comunicativo, Energico, Giocherellone', 
  //   aspettiPrincipali: 'Un tiragraffi è essenziale, Ha bisogno di una leggera toelettatura, Buoni con i bambini',
  // ),

  // contents/images/birmano.png
  // Cats(
  //   id: '2',
  //   razza:'Sacro di Birmania',
  //   descrizione: "Un gatto Birmano è a pelo semi-lungo con una colorazione più scura per le punte, il musetto, le zampe, le orecchie e la coda, e un colore del corpo più chiaro in tono con i point. E' un gatto di grandi dimensioni con corpo solido e zampe corte. Il gatto Birmano ha gli occhi azzurri e le zampette sono guantate di bianco puro.. La testa è larga e arrotondata con orecchie di medie dimensioni. Il mantello si può presentare in molti colori diversii ma sempre con i point.", 
  //   image: 'https://www.sacrodibirmania.com/immagini-sito/bellatrix-08.jpg', 
  //   imageCarousel: 'https://www.animalidacompagnia.it/wp-content/uploads/2018/04/Sacro-di-Birmania-.jpg',
  //   origine: "Sebbene non vi siano chiari dati sulle origini dei gatti Birmani, una coppia fu portata in Francia intorno al 1919, da essa poi la razza si stabilì nel mondo occidentale. Tuttavia, i gatti Birmani furono quasi spazzati via come razza durante la seconda guerra mondiale e furono pesantemente incrociati con razze a pelo lungo (principalmente persiani) e anche linee siamesi per ricostruire la razza. All'inizio degli anni '50, venivano nuovamente prodotte cucciolate pure di gatto Birmano. La razza riportata agli antihi splendori, fu riconosciuta in Gran Bretagna nel 1965.",
  //   personalita: "I gatti Birmani sono conosciuti come razza particolarmente affettuosa, essendo stati allevati come gatti domestici da molte generazioni. Sono docili e silenziosi. I gatti Birmani sono socievoli, intelligenti e amichevoli, curiosi e orientati alle persone, ma non troppo rumorosi.",
  //   paese: 'Birmania/Francia', 
  //   mantello: 'Pelo medio', 
  //   taglia: 'Media', 
  //   vita: '12-16 anni', 
  //   carattere: 'Socievole, Fedele, Amabile, Tranquillo, Giocherellone, Attivo', 
  //   aspettiPrincipali: 'Ha bisogno di una toelettatura moderata,Più adatto alla vita in casa,Buono con le persone',
  // ),
  // Cats(
  //   id: '3',
  //   razza: 'Siberiano',
  //   descrizione: "Il gatto siberiano è una razza di grandi dimensioni, con una corporatura muscolosa e torace a forma di botte. Il pelo è lungo e denso e la testa ha una forma a cuneo modificata con contorni arrotondati e occhi molto espressivi. L'aspetto fisico generale è di forza e potenza. I peli più lunghi del mantello sono chiari in prossimità della pelle, scurendosi verso l'estremità esterna. Questo fa luccicare il mantello mentre il gatto si muove. Sebbene il brown tabby (marrone striato) sia il colore più comune, il siberiano può avere un mantello di qualsiasi disegno o colore o combinazione di colori, fino al color point.", 
  //   image: 'https://image.jimcdn.com/app/cms/image/transf/dimension=2000x1500:format=jpg/path/s3eced3faa7c7599c/image/i6f6c2043e0a0363e/version/1649585251/nuove-nascite.jpg', 
  //   imageCarousel: 'https://www.tuttogreen.it/wp-content/uploads/2017/08/shutterstock_545113687.jpg',
  //   origine: "Sebbene non vi siano chiari dati sulle origini dei gatti Birmani, una coppia fu portata in Francia intorno al 1919, da essa poi la razza si stabilì nel mondo occidentale. Tuttavia, i gatti Birmani furono quasi spazzati via come razza durante la seconda guerra mondiale e furono pesantemente incrociati con razze a pelo lungo (principalmente persiani) e anche linee siamesi per ricostruire la razza. All'inizio degli anni '50, venivano nuovamente prodotte cucciolate pure di gatto Birmano. La razza riportata agli antihi splendori, fu riconosciuta in Gran Bretagna nel 1965.",
  //   personalita: "Il gatto Siberiano è il gatto nazionale della Russia. Questa razza naturale esiste in Russia da centinaia di anni. Esiste una storia documentata di siberiani già nel 1000 d.C. e si dice che sia l'antenato delle più moderne razze a pelo lungo. Dopo aver vissuto nel freddo clima russo per molte generazioni, la razza ha sviluppato una costituzione robusta e una densa tripla pelliccia resistente all'acqua. Alcuni gatti Siberiani furono importati in Gran Bretagna alla fine del 1800, ma la razza non divenne molto popolare, perché battuta dal persiano dal manto più lungo, setoso e colorato. L'interesse per la razza sta tornando a crescere ora nel Regno Unito.",
  //   paese: 'Russia', 
  //   mantello: 'Pelo lungo', 
  //   taglia: 'Grande', 
  //   vita: '15 anni', 
  //   carattere: 'Vivace, Intelligente, Giocherellone, Affettuoso', 
  //   aspettiPrincipali: 'Adatto alla vita in casa e fuori casa,Ha bisogno di frequente toelettatura,Più felice in coppia',

  // ),
  // Cats(
  //   '4',
  //   'Sphynx',
  //   "La caratteristica principale di un gatto Sphynx è la mancanza di una pelliccia! Essi possono essere completamente glabri o presentare una peluria fine in alcune zone del corpo come una pelle di pesca. Questo gatto non ha baffi o ciglia. La testa ricorda quella di un Devon Rex. Gli occhi sono profondi e a forma di limone. Il corpo è robusto e  muscoloso e ha un petto a botte. Le gambe sono lunghe e snelle e hanno un aspetto arcuato causato dal torace ampio. La coda è lunga e affusolata  Sono caldi e morbidi al tatto e hanno guadagnato il nome di 'borsa dell'acqua calda scamosciata'. La pelle è rugosa su parti della testa, del corpo e delle gambe. La pigmentazione è chiaramente visibile sulla pelle del gatto Sphynx. Tutti i disegni e i colori della pelle sono accettabili.", 
  //   'https://gattichepassione.com/wp-content/uploads/2022/06/cute-canadian-sphynx-cat-four-months-old-blue-mink-white-color-brown-background-min.jpg', 
  //   'https://www.tuttosuigatti.it/files/images/featured/79/sphynx-gatto-nudo.jpg',
  //   "Razze nude: i gatti senza peli sono noti da generazioni, si dice infatti che gli Aztechi avessero gatti senza peli. Il gatto Sphynx è la prima razza di gatto senza peli che è stata allevata appositamente per questo tratto distintivo. Il programma di allevamento iniziò nel 1966 in Ontario, in Canada, quando una gatta domestica partorì un gattino maschio completamente glabro. Un'altra cucciolata con la mutazione Sphynx fu scoperta a Toronto nel 1978. Oggi, la maggior parte dei gatti Sphynx discende da quei tre gattini glabri trovati a Toronto. ",
  //   "Il gatto Sphynx è estroverso, birichino, orientato verso le persone e ama l'attenzione. Questi gatti salutano spesso i loro proprietari quando tornano a casa e sono molto loquaci. Sono molto intelligenti, giocosi e coccolosi: gli sphynx, infatti, sono i campioni delle fusa e amano dormire con i loro proprietari sotto le coperte. La loro temperatura corporea è di un grado o due superiore alla media rispetto ai gatti normali e hanno appetiti voraci per compensare la perdita di calore. Con poca protezione contro gli elementi esterni, questi gatti non sopportano il freddo, non amano sedersi su superfici fredde e apprezzano il riscaldamento centralizzato! Se invece vanno fuori e si espongono al sole potrebbero addirittura aver bisogno di protezione solare.",
  //   'Russia', 
  //   'Senza pelo', 
  //   'Media', 
  //   '12-15 anni', 
  //   'Attivo, Socievole, Affettuoso, Intelligente, Fedele', 
  //   [
  //     'Ha bisogno di una toelettatura moderata',
  //     'Più adatto alla vita in casa',
  //     'Più felice in coppia'
  //   ]
  // ),
  // Cats(
  //   // contents/images/america_wirehair.png
  //   // https://upload.wikimedia.org/wikipedia/commons/5/50/Americanshorthair.JPG
    
  //   '5',
  //   'American Wirehair',
  //   "Come suggerisce il nome, 'wirehair' cioè 'pelo rigido' è il mantello che caratterizza questa razza. L'American Wirehair è di taglia grande e ha un pelo duro, elastico e ispido: ogni singolo pelo del mantello, da corto a medio, è sottile e arricciato o uncinato. I baffi sono spesso ricci. La piena estensione dell'arricciolamento diventa evidente solo quando il gatto è maturo; I gattini American Wirehair che sembrano avere mantelli molto ricci quando sono giovani, possono diventare da adulti soggetti con un mantello semplicemente ondulato, piuttosto che ispido, e viceversa. Sono disponibili in tutti i tipi di colori e motivi e disegni.", 
  //   'https://firebasestorage.googleapis.com/v0/b/catsapp-2848f.appspot.com/o/american_wirehair.png?alt=media', 
  //   'https://www.ideegreen.it/wp-content/uploads/2019/08/American-Wirehair-1.png',
  //   "Gatto di corporatura media L' American Wirehair è nata come mutazione spontanea in una cucciolata di gatti di una fattoria di New York nel 1966, quando fra una nidiata di fratellini normai nacque un gattino a pelo duro (di nome Adam) . Tutti i gatti di razza American Wirehair possono essere fatti risalire ad Adam. Il gatto American Wirehair è diventato popolare negli Stati Uniti e in Canada, ma è poco conosciuto altrove. ",
  //   "Il gatto American Wirehair è amichevole e rilassato. È rilassato, di carattere dolce, gentile e giocherellone, si diverte con i giocattoli e gioca con il suo proprietario. Questa non è una razza di gatto particolarmente loquace.",
  //   'USA', 
  //   'Pelo corto', 
  //   'Media', 
  //   '15-16 anni', 
  //   'Calmo, Socievole, Tranquillo, Affettuoso, Giocherellone, Intelligente, Indipendente', 
  //   [
  //     'Ha bisogno di una toelettatura moderata',
  //     'Più adatto alla vita in casa',
  //     'Paziente con i bambini e gli altri animali'
  //   ]
  // ),
  // Cats(
  //   // contents/images/blu_di_russia.png
  //   // https://gattichepassione.com/wp-content/uploads/2022/04/gray-cat-russian-blue-breed-dark-background-green-cat-eyes-min.jpg
  //   '6',
  //   'Blu di Russia',
  //   'Il Blu di Russia è un gatto elegante che dai suoi incroci con dei siamesi ha conservato uno stile orientale. La bocca leggermente ricurva gli dà un aspetto sorridente! I suoi occhi sono ovali e di un verde smeraldo ammaliante. Il suo corpo è muscoloso, longilineo e le zampe sono lunghe e fini. I peli sono corti (salvo nel Nebelung) e setosi. Il colore blu uniforme è il più diffuso. Tuttavia, esistono dei gatti Blu Russia bianchi il cui mantello è immacolato con dei riflessi argentati e neri di colore uniforme. Questo gatto miagola soprattutto per comunicare i suoi desideri ed il suo stato d’animo al suo padrone e la sua voce delicata e posata non fa di lui un gatto noioso. Le femmine sono generalmente più loquaci, esclusive e gelose dei maschi.',
  //   'https://firebasestorage.googleapis.com/v0/b/catsapp-2848f.appspot.com/o/blu_di_russia.png?alt=media',
  //   'https://www.ilmiogattoeleggenda.it/wp-content/uploads/2020/06/blu-di-russia-prezzo.jpg',
  //   "Malgrado il suo nome, le sue origini sono controverse. Sembrerebbe tuttavia che il Blu Russo venga dalle coste russe del mare Bianco. Dopo aver effettuato degli incroci con dei gatti delle foreste norvegesi, sarebbe stato trasportato in battello fino in Gran Bretagna. Alcuni dicono, al contrario, che proviene dal Bacino Mediterraneo e che avrebbe dunque delle origini comuni con i gatti Certosini (Chartreux). Degli incroci con dei British Shorthair e dei Siamesi blu point permisero di salvare la razza negli anni 1950. ",
  //   "Docile, affettuoso, gioioso, paziente, è un gatto che ama giocare con i familiari (meno con gli sconosciuti) ed essere coccolato spesso. Nonostante sia vivace, è anche un po' pigro, soprattutto durante l'inverno, quando ama poltrire sul divano.",
  //   'Russia', 
  //   'Pelo corto', 
  //   'Media', 
  //   '15-20 anni', 
  //   'Socievole, Intelligente, Giocherellone', 
  //   [
  //     'Necessita di una recinzione esterna',
  //     'Ha bisogno di una leggera toelettatura',
  //     'Paziente con i bambini e gli altri animali'
  //   ]
  // ),
  // Cats(
  //   // contents/images/bombay.png
  //   // https://upload.wikimedia.org/wikipedia/commons/a/ac/Bombay_femelle.JPG
  //   '7',
  //   'Bombay',
  //   'Il Bombay è un gatto di corporatura media, con un mantello nero lucido che brilla come la pelle verniciata. La sua testa ha una forma delicatamente arrotondata, orecchie arrotondate e un muso largo smussato. I bellissimi occhi rame / oro sono ben distanziati ed espressivi. Il corpo è solido e muscoloso con una forte schiena dritta. La cute del naso e i bordi degli occhi sono neri e i cuscinetti delle zampe sono neri o marrone scuro.',
  //   'https://firebasestorage.googleapis.com/v0/b/catsapp-2848f.appspot.com/o/bombay.png?alt=media',
  //   'https://www.tuttogreen.it/wp-content/uploads/2017/03/shutterstock_774381946.jpg',
  //   "Il gatto Bombay è un appartenente al gruppo degli Asian cats , è una razza costruita da allevatori che tentano di creare gatti di tipo burmese, con colori non riconosciuti nei burmesi. Nel Regno Unito, il gatto Bombay è la versione nera dell'Asian cat.",
  //   "I gatti della razza del gruppo asiatico sono estremamente amichevoli e affettuosi. I gatti Bombay hanno voci uniche e di solito sono molto vocali. (Non sono un tradizionale).",
  //   'Gran Bretagna e USA', 
  //   'Pelo corto', 
  //   'Media', 
  //   '12-16 anni', 
  //   'Socievole, Intelligente, Affettuoso, Docile, Attivo', 
  //   [
  //     'Adatto alla vita in casa e fuori casa',
  //     'Ha bisogno di una leggera toelettatura',
  //     'Non dovrebbe essere lasciato solo'
  //   ]
  // ),
  // Cats(
  //   '8',
  //   "Gatto d'Angora",
  //   "L'angora è un gatto di media grandezza, le femmine variano tra i 3 e i 4 kg di peso, mentre i maschi non devono superare i 4,5–5 kg. La struttura del corpo è leggera ed elegante, seppur muscolosa, con zampe affusolate e coda molto lunga. In particolare, le zampe anteriori sono leggermente più corte delle posteriori e le spalle e le anche hanno la stessa larghezza. I piedini sono piccoli e rotondi. La testa è affusolata e lunga, in forma di cuneo allungato.",
  //   'https://www.veterinari.it/images/articoli/gatti/articoli/angora_turco.jpg',
  //   'https://www.cane-e-gatto.it/wp-content/uploads/2019/04/gatto-angora-turco.jpeg?x15915',
  //   "Le origini del gatto d'Angora sono molto antiche e si possono, forse, far risalire sino al XV secolo. Fino al 1930 si hanno solo poche notizie, sporadiche e indiziarie, mentre la storia comincia ad avere contorni nitidi dalla terza decade del XX secolo, quando il governo turco proclamò la variante bianca tesoro nazionale e iniziò un programma di protezione e allevamento presso gli zoo di Ankara[1], Smirne e Istanbul. Attorno a questi gatti gravitano anche molte leggende, per lo più di origine turca.",
  //   "Il gatto d'Angora Turco è un vero e proprio compagno ideale in famiglia. Il carattere del gatto d'Angora si contraddistingue per essere dolce e tenero. Si tratta infatti nella maggior parte dei casi di felini tranquilli ed equilibrati, con però un temperamento piuttosto vivace e una spiccata personalità.",
  //   'Turchia', 
  //   'Pelo medio', 
  //   'Media', 
  //   '12-18 anni', 
  //   'Adattabile, Amabile, Giocherellone, Fiducioso', 
  //   [
  //     'Paziente con i bambini e gli altri animali',
  //     'Più adatto alla vita in casa',
  //     'Ha bisogno di una leggera toelettatura'
  //   ]
  // ),
  // Cats(
  //   '9',
  //   "Maine Coon",
  //   "La più grande di tutte le razze di gatti, il gatto Maine Coon ha un corpo muscoloso potente e gambe consistenti. La testa ha un muso squadrato e grandi orecchie portate larghe e alte. Il pelo è lungo e spesso ed è costituito da un sottopelo ricoperto da un  rivestimento lucido e resistente all'acqua. Il pelo sulla testa, sul collo e sulle spalle è più corto, aumenta poi in lunghezza lungo la schiena, i lati e la coda. Il pelo sulla pancia e sulle gambe è folto e ispido. C'è un collare di pelo, che inizia alla base delle orecchie ed è più pesante nei maschi rispetto alle femmine. I peli della coda sono lunghi e fluenti. Le orecchie hanno punte con ciuffi molto evidenti detti lynx tuft. Anche le le zampe hanno folti ciuffi di pelo che danno alla camminate del Maine Coon il classico 'effetto ciaspola'. Il mantello può presentare una varietà di 30 o più colori. Gli occhi possono essere verdi, dorati o ramati: nei gatti bianchi è possibile avere occhi blu o di due colori diversi (occhi impari).",
  //   'https://www.ilmelograno.to.it/site/wp-content/uploads/2019/05/Maine-Coon.jpg',
  //   'https://wips.plug.it/cips/paginegialle.it/magazine/cms/2021/05/gatto-main-coon.jpg',
  //   "Gli antenati del gatto Maine Coon erano gatti a pelo lungo e furono portati nello stato del Maine, in America, dai navigatori nel 1850. Questi gatti si sono accoppiati con i gatti locali a pelo corto. La progenie era di grandi dimensioni: gatti forti e robusti dai mantelli semi-lunghi e code a spazzola che assomigliavano alla coda di un procione, da cui il nome Maine Coon. I gatti hanno sviluppato spessi mantelli densi per resistere agli inverni estremi del Maine. Già negli anni 1860 si tenevano esposizioni feline speciali per i gatti Maine Coon e la razza divenne molto popolare come animale domestico. Il gatto Maine Coon fu importato nel Regno Unito negli anni '80.",
  //   "I gatti Maine Coon hanno una natura dolce e sono molto giocosi e amichevoli. Amano la compagnia umana e sono dei bravi animali domestici. Forse a causa delle loro umili origini vengono spesso ritrovati rannicchiati nei posti più strani. Godono della vita all'aria aperta e quindi ogni tanto hanno bisogno di arrampicarsi e simulare la caccia. I gatti Maine Coon sono noti per il delizioso suono che emettono, simile a un cinguettio.",
  //   'Usa', 
  //   'Pelo medio', 
  //   'Grande', 
  //   '9-15 anni', 
  //   'Socievole, Intelligente, Vivace', 
  //   [
  //     'Poco adeguato con i bambini',
  //     'Si adatta facilmente alla casa',
  //     'Ha bisogno di una frequente toelettatura'
  //   ]
  // ),
  // Cats(
  //   '10',
  //   "British Longhair",
  //   "Come nel British Shorthair, le orecchie sono piccole e tondeggianti: insieme ai grandi occhi scuri e rotondi e al pelo soffice, contribuiscono a conferire al British Longhair l'aspetto di un simpatico orsacchiotto. Le femmine pesano tra i 4 e i 6 kg, mentre i maschi arrivano a 8 kg.",
  //   'https://www.ilmiogattoeleggenda.it/wp-content/uploads/2020/04/British-Longhair.jpg',
  //   'https://www.zooplus.it/magazine/wp-content/uploads/2022/10/british-longhair-di-4-mesi.jpg',
  //   "La razza British Longhair è relativamente giovane e non ancora riconosciuta da tutte le associazioni feline, che spesso insistono nel considerarla semplicemente una variante. I primi incroci tra British Shorthair e Persiano vennero effettuati nel XIX secolo, con l’obiettivo di donare ai gatti originari della Gran Bretagna un aspetto più particolare che potesse competere con le razze orientali (soprattutto il Siamese), che a quell’epoca andavano per la maggiore alle mostre feline. Questi gatti, infatti, avevano non solo un aspetto esotico ma anche delle linee più aggraziate ed eleganti rispetto agli esemplari British, che in confronto apparivano robusti e quasi sgraziati.",
  //   "I British Longhair combinano le caratteristiche dei British Shorthair e dei Persiani: si tratta di una razza calma, rilassata, affettuosa, socievole e accomodante. Questi gatti che ricordano gli orsacchiotti apprezzano la vita in famiglia, ma non l'eccesso di contatto.",
  //   'Regno Unito', 
  //   'Pelo lungo', 
  //   'Medio', 
  //   '15-17 anni', 
  //   'Calmo , Socievole , Tranquillo, Docile', 
  //   [ 
  //     'Paziente con i bambini e gli altri animali',
  //     'Adatto alla vita in casa e fuori casa',
  //     'Ha bisogno di una frequente toelettatura'
  //   ]
  // )
];