use strict;
use warnings;

use Test::More;
use File::Basename;
use File::Find ();
use Locale::PO;

chdir dirname(__FILE__) . "/..";

use vars qw/*name *dir *prune %european_languages/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

%european_languages = (
    bg_BG => {
      more_info => "повече информация",
      ad_badge => "Вашата поверителност при гледане на реклами е защитена от DuckDuckGo. Рекламните кликове се управляват от рекламната мрежа на Microsoft"
    },
    cs_CZ => {
      more_info => "více informací",
      ad_badge => "Při zobrazení reklam společnost DuckDuckGo chrání vaše soukromí. Kliknutí na reklamy jsou spravována reklamní sítí společnosti Microsoft"
    },
    da_DK => {
      more_info => "mere info",
      ad_badge => "DuckDuckGo beskytter dine personoplysninger, når du ser annoncer. Annonceklik administreres af Microsofts annoncenetværk"
    },
    de_DE => {
      more_info => "Weitere Informationen",
      ad_badge => "Der Datenschutz beim Aufrufen von Anzeigen wird durch. DuckDuckGo gewährleistet. Die Anzeigen-Klicks werden durch das Microsoft-Werbenetzwerk verwaltet"
    },
    el_GR => {
      more_info => "περισσότερες πληροφορίες",
      ad_badge => "Στην προβολή διαφημίσεων υπάρχει προστασία απορρήτου από την DuckDuckGo. Η διαχείριση των κλικ διαφήμισης γίνεται από το δίκτυο διαφημίσεων της Microsoft"
    },
    es_ES => {
      more_info => "más información",
      ad_badge => "DuckDuckGo protege la privacidad de la visualización de anuncios. La red de anuncios de Microsoft gestiona los clics en los anuncios"
    },
    et_EE => {
      more_info => "lisateave",
      ad_badge => "DuckDuckGo kaitseb reklaamide vaatamisel teie privaatsust. Reklaamiklõpse haldab Microsofti reklaamivõrgustik"
    },
    fi_FI => {
      more_info => "lisätietoa",
      ad_badge => "Mainosten katselu on DuckDuckGo:n tietosuojaama. Mainosklikkauksia hallinnoi Microsoftin mainosverkosto"
    },
    fr_FR => {
      more_info => "plus d'informations",
      ad_badge => "La confidentialité des annonces est protégée par DuckDuckGo. Les clics sur les annonces sont gérés par le réseau publicitaire Microsoft de"
    },
    hr_HR => {
      more_info => "više informacija",
      ad_badge => "Pregledavanje oglasa je privatnost koju štiti DuckDuckGo. Klikovima na oglase upravlja Microsoftova oglasna mreža"
    },
    hu_HU => {
      more_info => "További információ",
      ad_badge => "A hirdetéseket a DuckDuckGo adatvédelme keretében tekintheted meg. A hirdetéskattintásokat a Microsoft hirdetési hálózata kezeli"
    },
    is_IS => {
      more_info => "frekari upplýsingar",
      ad_badge => "Að skoða auglýsingar fellur undir persónuvernd frá DuckDuckGo. Auglýsingasmellum er stjórnað af auglýsinganeti Microsoft"
    },
    it_IT => {
      more_info => "Maggiori Informazioni",
      ad_badge => "La privacy della visualizzazione degli annunci è protetta da DuckDuckGo. I clic sugli annunci sono gestiti dalla rete pubblicitaria di Microsoft"
    },
    lt_LT => {
      more_info => "daugiau informacijos",
      ad_badge => "Peržiūrimų skelbimų privatumą saugo „DuckDuckGo“. Skelbimų spustelėjimus tvarko „Microsoft“ skelbimų tinklas"
    },
    lv_LV => {
      more_info => "papildu informācija",
      ad_badge => "Reklāmu skatīšanu aizsargā DuckDuckGo konfidencialitāte. Klikšķus uz reklāmām pārvalda Microsoft reklāmu tīkls"
    },
    nb_NO => {
      more_info => "mer info",
      ad_badge => "Visningsannonser er personvernbeskyttet av DuckDuckGo. Annonseklikk administreres av Microsofts annonsenettverk"
    },
    nl_NL => {
      more_info => "meer informatie",
      ad_badge => "De weergave van advertenties wordt beschermd door DuckDuckGo. Advertentieklikken worden beheerd door het advertentienetwerk van Microsoft"
    },
    pl_PL => {
      more_info => "więcej informacji",
      ad_badge => "DuckDuckGo chroni prywatność użytkowników przeglądających reklamy. Klikanie reklam zarządzane jest przez sieć reklamową Microsoft"
    },
    pt_PT => {
      more_info => "mais informações",
      ad_badge => "A visualização de anúncios tem proteção de privacidade pelo DuckDuckGo. Os cliques em anúncios são geridos pela rede de publicidade da Microsoft"
    },
    ro_RO => {
      more_info => "mai multe informații",
      ad_badge => "Vizualizarea reclamelor este protejată de confidențialitatea DuckDuckGo. Clicurile pe reclame  sunt gestionate de rețeaua publicitară Microsoft"
    },
    ru_RU => {
      more_info => "подробнее",
      ad_badge => "DuckDuckGo обеспечивает защиту конфиденциальности пользователей при просмотре рекламных объявлений. Управление переходами по рекламным объявлениям осуществляется рекламной сетью «Майкрософт»"
    },
    sk_SK => {
      more_info => "ďalšie informácie",
      ad_badge => "Zobrazenie reklám je chránené ochranou osobných údajov DuckDuckGo. Kliknutia na reklamy spravuje reklamná sieť spoločnosti Microsoft"
    },
    sl_SI => {
      more_info => "več informacij",
      ad_badge => "DuckDuckGo ščiti vašo zasebnost pri ogledu oglasov. S kliki na oglase upravlja Microsoftovo oglaševalsko omrežje"
    },
    sv_SE => {
      more_info => "mer info",
      ad_badge => "Visning av annonser är sekretessskyddat av DuckDuckGo. Annonsklick hanteras av Microsofts annonsnätverk"
    },
    tr_TR => {
      more_info => "daha fazla bilgi",
      ad_badge => "Reklam görüntüleme, DuckDuckGo’nun gizlilik koruması altındadır. Reklam tıklamaları, Microsoft’un reklam ağı tarafından yönetilir"
    }
);

sub wanted;

sub translation_check {
    my ( $name, $msgid, $msgstr ) = map { s/^"//r =~ s/"$//r } @_;
    # We only need the locale code
    my $locale = (split "/", $name)[1];

    if ( exists( $european_languages{$locale} )) {
        my $which_msg = ( $msgid =~ /More\sInfo/ ) ? "more_info" : "ad_badge";
        my $msg_expected = $european_languages{$locale}{$which_msg}; 
        return 1 if $msgstr eq $msg_expected;
    } else {
        return 1 if $msgstr eq "";
    }
}

File::Find::find({wanted => \&wanted}, 'locales');
done_testing;

sub wanted {
    /^.*\.po\z/s || return;
    my $po = Locale::PO->load_file_asarray( $_ );
    for ( @{ $po } ) {
        next unless $_->msgctxt;
        next unless $_->msgctxt =~ /Ads\sGDPR,\sinternal\suse\sonly\.\sDo\snot\schange/;
        ok( translation_check( $name, $_->msgid, $_->msgstr ),
          'Translation for ' . $_->msgid . ' in ' . $name . ' should not be changed : ' . $_->msgstr )
    }
}

