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
    af_ZA => {
      more_info => "Nog Inligting",
      ad_badge => "Jou privaatheid word deur DuckDuckGo beskerm as jy na advertensies kyk. Advertensie-klikke word deur Microsoft se advertensienetwerk bestuur"
    },
    be_BY => {
      more_info => "Больш звестак",
      ad_badge => "Прыватнасць прагляду рэкламы абараняецца DuckDuckGo. Націсканні на рэкламныя аб'явы кіруюцца сеткай Microsoft"
    },
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
    hi_IN => {
      more_info => "अधिक जानकारी",
      ad_badge => "विज्ञापन देखना DuckDuckGo द्वारा गोपनीयता संरक्षित है। विज्ञापन क्लिक को Microsoft के विज्ञापन नेटवर्क द्वारा प्रबंधित किया जाता है"
    },
    hr_HR => {
      more_info => "više informacija",
      ad_badge => "Pregledavanje oglasa je privatnost koju štiti DuckDuckGo. Klikovima na oglase upravlja Microsoftova oglasna mreža"
    },
    hu_HU => {
      more_info => "További információ",
      ad_badge => "A hirdetéseket a DuckDuckGo adatvédelme keretében tekintheted meg. A hirdetéskattintásokat a Microsoft hirdetési hálózata kezeli"
    },
    id_ID => {
      more_info => "Info Lebih Banyak",
      ad_badge => "Melihat iklan adalah privasi yang dilindungi oleh DuckDuckGo. Klik iklan dikelola oleh jaringan iklan Microsoft"
    },
    is_IS => {
      more_info => "frekari upplýsingar",
      ad_badge => "Að skoða auglýsingar fellur undir persónuvernd frá DuckDuckGo. Auglýsingasmellum er stjórnað af auglýsinganeti Microsoft"
    },
    it_IT => {
      more_info => "Maggiori Informazioni",
      ad_badge => "La privacy della visualizzazione degli annunci è protetta da DuckDuckGo. I clic sugli annunci sono gestiti dalla rete pubblicitaria di Microsoft"
    },
    ja_JP => {
      more_info => "詳細",
      ad_badge => "広告表示機能のプライバシーは DuckDuckGo で保護されます。広告のクリックは Microsoft の広告ネットワークで管理されています"
    },
    ko_KR => {
      more_info => "더 많은 정보",
      ad_badge => "광고 보기 시 DuckDuckGo에 의해 개인 정보가 보호됩니다. 광고 클릭은 마이크로소프트의 광고 네트워크에서 관리합니다."
    },
    lt_LT => {
      more_info => "daugiau informacijos",
      ad_badge => "Peržiūrimų skelbimų privatumą saugo „DuckDuckGo“. Skelbimų spustelėjimus tvarko „Microsoft“ skelbimų tinklas"
    },
    lv_LV => {
      more_info => "papildu informācija",
      ad_badge => "Reklāmu skatīšanu aizsargā DuckDuckGo konfidencialitāte. Klikšķus uz reklāmām pārvalda Microsoft reklāmu tīkls"
    },
    ml_IN => {
      more_info => "കൂടുതൽ വിവരങ്ങൾ",
      ad_badge => "പരസ്യങ്ങൾ കാണുന്നത് DuckDuckGo സ്വകാര്യതാ പരിരക്ഷ ചെയ്തിരിക്കുന്നു. പരസ്യ ക്ലിക്കുകൾ നിയന്ത്രിക്കുന്നത് മൈക്രോസോഫ്റ്റിന്റെ പരസ്യ നെറ്റ്‌വർക്കാണ്"
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
    si_LK => {
      more_info => "දත්ත තවත්",
      ad_badge => "දැන්වීම් බැලීම DuckDuckGo මගින් පුද්ගලිකත්වය ආරක්ෂා කරයි. දැන්වීම් ක්ලික් කිරීම් කළමනාකරණය කරනු ලබන්නේ Microsoftහි දැන්වීම් ජාලය විසිනි"
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
    th_TH => {
      more_info => "ข้อมูลเพิ่มเติม",
      ad_badge => "การดูโฆษณาได้รับการปกป้องความเป็นส่วนตัวโดย DuckDuckGo การคลิกโฆษณาได้รับการจัดการโดยเครือข่ายโฆษณาของ Microsoft"
    },
    tr_TR => {
      more_info => "daha fazla bilgi",
      ad_badge => "Reklam görüntüleme, DuckDuckGo’nun gizlilik koruması altındadır. Reklam tıklamaları, Microsoft’un reklam ağı tarafından yönetilir"
    },
    uk_UA => {
      more_info => "Більше Інформації",
      ad_badge => "Перегляд оголошень виконується із захистом конфіденційності DuckDuckGo. Клацаннями оголошень керує рекламна мережа Microsoft"
    },
    zh_CN => {
      more_info => "更多信息",
      ad_badge => "DuckDuckGo 会保护观看广告的隐私。广告点击量由 Microsoft 广告网络管理"
    },
    zh_TW => {
      more_info => "查看更多資訊",
      ad_badge => "DuckDuckGo 會保護你在觀看廣告時的隱私。點擊廣告則由 Microsoft 的廣告網路管理"
    },
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
