import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:petsguide/constants/theme.dart';

class HtmlText extends StatelessWidget {
  HtmlText(this.text, {super.key});
  final text;

  String prova = """
  <div align="justify">
    <h2><span style="color: #d68c47;"><strong>Aspetto</strong></span></h2>
    <p>Non c'&egrave; da stupirsi che l&rsquo;Abissino venga spesso chiamato "Mini-Puma", perch&egrave; questo gatto con le zampe lunghe e slanciate ha un aspetto atletico e vivace! Inoltre &egrave; una delle razze feline pi&ugrave; leggere: la femmina pesa al massimo 4 kg e il maschio 5 kg.</p>
    <p>Il suo carattere socievole e curioso si rispecchia nel suo musetto: il gatto Abissino ha grandi occhi a mandorla ambrati, verdi o marrone chiaro con palpebre che sembrano truccate da una riga nera. Le grandi orecchie rivelano che l'Abissino &egrave; un buon ascoltatore, sempre interessato a ci&ograve; che accade nell'ambiente circostante e alla sua famiglia umana. Le orecchie sono larghe alla base e distanziate tra loro. La testa cuneiforme ha un contorno morbido e poggia su un collo grazioso e slanciato. Le lunghe zampe terminano in piedi ovali e la coda allungata completa l'aspetto di questo felino agile e attivo.</p>
    <p>A causa dello scarso sottopelo, il pelo dell'Abissino &egrave; fine e soffice. Tuttavia ha una gorgiera ben sviluppata, anche se sul dorso il pelo &egrave; un po' pi&ugrave; corto.</p>
    <p>L'Abissino ha un manto dal colore molto vistoso, simile a qullo di un coniglio selvatico. L'"effetto Agouti" &egrave; dovuto al cosiddetto&nbsp;<em>ticking</em>: ogni singolo pelo &egrave; diviso in 2 &ndash; 4 bande che terminano in una punta scura. Soltanto i peli della testa, del dorso, della coda e della parte esterna delle zampe presentano il&nbsp;<em>ticking;&nbsp;</em>al contrario l'addome, il petto e la parte interna delle zampe presentano il colore base.</p>
    <p>Questa vistosa colorazione &egrave; completata dalle strisce sul dorso e le striature scure spesso sono evidenti anche sulle zampe posteriori e arrivano fino ai talloni.</p>
    <p>Il&nbsp;<em>ticking</em>&nbsp;&egrave; un componente fisso dello standard di razza dell'Abissino. La colorazione si manifesta a partire dalla sesta settimana di vita, ma diventa completa solo quando il gatto ha due anni: a quel punto il pelo ha un disegno uniforme, simile a quello di una lepre selvatica.</p>
    <p>Le associazioni di allevatori accettano soltanto i colori a base di eumelanina, un pigmento che garantisce un forte assorbimento della luce favorendo una pigmentazione scura. Lo standard di razza accetta i colori Lepre, Blu, Sorrel e Fawn.</p>
    <ul>
    <li><strong>Lepre</strong>: il colore originario dell'Abissino. Ha tonalit&agrave; caldo marrone e il colore base va dall'albicocca scuro all'arancio con&nbsp;<em>ticking</em>&nbsp;nero. Tutti gli altri colori derivano dal color Lepre. Nel linguaggio comune viene anche detto&nbsp;<em>ruddy</em>,&nbsp;<em>usual</em>,&nbsp;<em>tawny</em>&nbsp;e&nbsp;<em>li&egrave;vre</em>.</li>
    <li><strong>Blu</strong>: non indica tanto il blu quanto diverse sfumature intense di colore blu-grigio. In realt&agrave; questo colore &egrave; la diluizione del Lepre, provocata dalla mutazione di un gene che &egrave; responsabile dell'intensit&agrave; della colorazione. L'Abissino blu ha il pelo grigio-blu e i singoli peli hanno un&nbsp;<em>ticking</em>&nbsp;blu acciaio &ndash; grigio scuro.</li>
    <li><strong>Sorrel</strong>: l'Abissino con calda colorazione rosso-cannella e&nbsp;<em>ticking</em>&nbsp;fulvo viene definito&nbsp;<em>Sorell,</em>&nbsp;ma qualche volta anche&nbsp;<em>cinnamon</em>&nbsp;o rosso. Inoltre, la colorazione&nbsp;<em>Sorell</em>&nbsp;non va confusa con il colore rosso vero e proprio. Il Sorrel deriva dalle mutazioni del gene responsabile del pelo di colore nero.</li>
    <li><strong>Fawn</strong>: &egrave; la diluizione del Sorell. L'Abissino&nbsp;<em>Fawn</em>&nbsp;presenta un colore base beige tenero rosato con un caldo ticking sempre di color crema. La superficie del naso &egrave; rosa.</li>
    </ul>
    <p>Esistono anche altre colorazioni quali Cioccolato e la sua diluizione Lilac, ma finora non sono riconosciute da tutte le associazioni di allevatori.</p>
    <p>A partire dagli anni Cinquanta, soprattuto in Inghilterra, continuavano a comparire soggetti a pelo lungo nelle figliate di Abissini. Questi gatti divennero gli antenati del gatto Somalo, una variante dell'Abissino a pelo medio-lungo. I Somali e gli Abissini hanno lo stesso standard di razza.</p>
  </div>
""";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return HtmlWidget(text, textStyle: theme.textTheme.labelMedium!.copyWith(color: Colors.grey.shade600));
  }
}