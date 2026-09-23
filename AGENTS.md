# AGENTS.md

## Cursor Cloud specific instructions

This repository (`duckduckgo-locales`) is a translation catalog, not a running
service. It contains gettext PO files under `locales/<code>/LC_MESSAGES/duckduckgo.po`,
a source template `duckduckgo.pot`, locale metadata in `locales.json`, and a
Perl-based validation test suite in `t/`. There is no web server or daemon to run.

### Prerequisites (baked into the VM image, not the update script)
- `gettext` (provides `msgfmt`/`msgunfmt`) — required by `t/00-build.t`.
- `cpanminus` (`cpanm`) — used to install the Perl module dependencies.

These system packages are installed via `apt-get` during environment setup and
are captured in the VM snapshot, so the startup update script only refreshes the
Perl module dependencies from `cpanfile`.

### Lint / Test / Build / Run
- Test (this is the primary workflow, mirrors `.github/workflows/run-tests.yml`):
  `prove -r t`
  - The suite runs ~450k assertions across all locale files and takes ~30-40s.
- Lint: there is no dedicated linter. For quick syntax checks use `perl -c t/<file>.t`
  for the tests and `node --check adapt-translations-from-smartling.js` for the JS helper.
- Build: "building" here means compiling a PO catalog to a binary `.mo`, e.g.
  `msgfmt locales/it_IT/LC_MESSAGES/duckduckgo.po -o /tmp/it.mo`. Compiled `.mo`
  files are git-ignored.
- Run (the only executable "application"): `node ./adapt-translations-from-smartling.js`
  imports Smartling exports into `locales/`. It is interactive and prompts for a
  folder path (pipe the path via stdin to run non-interactively). Note: it only
  picks up locale subfolders named with a dash, e.g. `it-IT` (not `it_IT`), and
  writes them to the underscore-named `locales/<code>/LC_MESSAGES/duckduckgo.po`.

### Gotchas
- `msgfmt` must be on `PATH` or `t/00-build.t` fails silently-looking (it checks `$?`).
- Perl module deps (`Locale::PO`, `Test::Fatal`, `Cpanel::JSON::XS`) come from
  `cpanfile`; install with `cpanm --installdeps .`.
