# duckduckgo-locales

Translation files for [duckduckgo.com](https://duckduckgo.com/).

## Professional translations for major languages

We're now using a professional service to translate languages in our major markets. This builds on the fantastic work of our translation community and will enable us to attain full coverage and consistency across languages. 

The following languages will be affected:
- Afrikaans
- Belarusian
- Bulgarian
- Chinese (Simplified)
- Chinese (Traditional)
- Croatian
- Czech
- Danish
- Dutch
- Estonian
- Finnish
- French
- German
- Greek
- Hindi
- Hungarian
- Indonesian
- Italian
- Japanese
- Korean
- Latvian
- Lithuanian
- Malayalam (India)
- Norwegian
- Polish
- Portuguese (Portugal)
- Romanian
- Russian
- Sinhala
- Slovak
- Slovenian
- Spanish
- Swedish
- Thai
- Turkish
- Ukrainian

We're very grateful for all the translation contributions that have helped support users around the world up to now, and we still welcome comments to help us improve translations. Please [open an Issue](https://github.com/duckduckgo/duckduckgo-locales/issues/new) and let us know what you think.

## About PO files

PO files contain lists of tokens and translations. Tokens are stored in "msgid" values and translations in "msgstr" values, e.g.

```PO
msgid "%s blocked by safe search."
msgstr "%s wurde von der sicheren Suche blockiert."
```

An untranslated token has an empty msgstr:

```PO
msgid "%s blocked by safe search."
msgstr ""
```

## PO editing software

While you can edit PO files in any text editor or directly on GitHub, there are some tools which can simplify the process (highlight untranslated tokens etc.)

- [Poedit](https://poedit.net/)
- [Online PO file editor](https://localise.biz/free/poeditor)

## Where to find the PO file for your language

Example: Deutsch (Deutschland)

Find the locale code for your language in the list below. The file can be found under locales/, e.g. locales/de_DE/LC_MESSAGES/duckduckgo.po

## Currently supported locales (Please see issue [#13](https://github.com/duckduckgo/duckduckgo-locales/issues/13) for discussion on this)

- af_ZA: Afrikaans (South Africa)
- ar_DZ: العربية (الجزائر)
- ar_EG: العربية (مصر)
- ar_JO: العربية (الأردن)
- ar_SA: العربية (السعودية)
- ast_ES: Asturianu
- az_AZ: Azərbaycan dili
- be_BY: беларуская (Беларусь)
- bg_BG: български (България)
- bn_BD: বাংলা(বাংলাদেশ)
- bn_IN: বাংলা (ভারত)
- bo_CN: བོད་སྐད་
- br_FR: Brezhoneg
- bs_BA: Bosanski
- ca_ES: català (Espanya)
- cs_CZ: čeština (Česká republika)
- cy_GB: Cymraeg
- da_DK: Dansk (Danmark)
- de_CH: Deutsch (Schweiz)
- de_DE: Deutsch (Deutschland)
- el_GR: Ελληνικά (Ελλάδα)
- en_AU: English (Australia)
- en_CA: English (Canada)
- en_GB: English (United Kingdom)
- en_US: English (United States)
- eo_XX: Esperanto
- es_AR: español (Argentina)
- es_CL: español (Chile)
- es_CO: español (Colombia)
- es_CR: español (Costa Rica)
- es_EC: español (Ecuador)
- es_ES: español (España)
- es_MX: español (México)
- es_PE: español (Perú)
- es_UY: español (Uruguay)
- es_VE: español (Venezuela)
- et_EE: Eesti (Eesti)
- eu_ES: Euskara
- fa_IR: فارسی
- fi_FI: suomi (Suomi)
- fr_BE: français (Belgique)
- fr_CA: français (Canada)
- fr_CH: français (Suisse)
- fr_FR: français (France)
- ga_IE: Gaeilge (Éire)
- gd_GB: Gàidhlig
- gl_ES: Galego
- gu_IN: ગુજરાતી
- he_IL: עברית‏
- hi_IN: हिंदी (भारत)
- hr_HR: hrvatski (Hrvatska)
- hu_HU: magyar (Magyarország)
- hy_AM: Հայերեն
- id_ID: Bahasa Indonesia
- io_XX: Ido
- is_IS: íslenska (Ísland)
- it_IT: italiano (Italia)
- ja_JP: 日本語 (日本)
- ka_GE: ქართული
- kn_IN: ಕನ್ನಡ (India)
- ko_KR: 한국어 (대한민국)
- ku: Kurdî
- kw_GB: Kernowek
- ky_KG: кыргызча
- ln_CD: Lingála
- lt_LT: Lietuvių (Lietuva)
- lv_LV: Latviešu (Latvija)
- ml_IN: മലയാളം
- mn_MN: Монгол
- mr_IN: मराठी
- ms_MY: Bahasa Melayu (Malaysia)
- nb_NO: Norsk (bokmål)
- ne_NP: नेपाली
- nl_BE: Nederlands (België)
- nl_NL: Nederlands (Nederland)
- nn_NO: Norsk (nynorsk)
- od_IN: ଓଡ଼ିଆ (ଭାରତ)
- pl_PL: polski (Polska)
- ps_AF: پښتو
- pt_BR: português (Brasil)
- pt_PT: português (Portugal)
- ro_RO: română (România)
- ru_RU: русский (Россия)
- si_LK: සිංහල
- sk_SK: Slovenčina (Slovenská republika)
- sl_SI: Slovenščina (Slovenija)
- sq_AL: shqip (Shqipëria)
- sr_RS: Српски (Serbia)
- sv_SE: svenska (Sverige)
- ta_IN: தமிழ்
- te_IN: తెలుగు
- th_TH: ไทย (ประเทศไทย)
- tl_PH: Filipino
- tokipona_XX: Toki Pona
- tpi_PG: Tok Pisin
- tr_TR: Türkçe (Türkiye)
- uk_UA: українська (Україна)
- ur_PK: اردو
- vi_VN: Tiếng Việt (Việt Nam)
- zh_CN: 中文 (中国)
- zh_TW: 中文 (台灣)

## Import translations from Smartling

**Note:** This is only needed for DuckDuckGo employees. Community translators can ignore it 🙂.

To import translations from Smartling:

1. Unzip the output file
2. From this folder, run `node ./adapt-translations-from-smartling.js`
3. The script will ask for the location of the translated files. On macOS you can drag-drop the folder you just unzipped from Finder right to the terminal window
4. Hit enter
5. Review and commit 🎉
