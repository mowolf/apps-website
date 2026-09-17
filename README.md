# apps.moritzwolf.com

Static landing pages for Moritz Wolf's apps, served by GitHub Pages at
<https://apps.moritzwolf.com>.

No build step. Every page is hand-written HTML sharing one stylesheet; what is
in this repository is exactly what is served.

## Layout

```
index.html              the list of apps
style.css               the only stylesheet
CNAME                   the custom domain for GitHub Pages
.nojekyll               serve the files as-is, no Jekyll processing
<app>/index.html        one landing page per app
<app>/privacy/index.html  the privacy policy linked from App Store Connect
```

| App | Path | Privacy URL | Source repo |
| --- | --- | --- | --- |
| The Sheep | `/thesheep/` | `/thesheep/privacy/` | `~/repos/TheSheep` |
| Loggi | `/loggi/` | `/loggi/privacy/` | `~/repos/Loggi` |
| Time Delta | `/time-delta/` | `/time-delta/privacy/` | `~/repos/uhrtracker` |
| GeoDrone | `/geodrone/` | `/geodrone/privacy/` | `~/repos/dipul-ios` |
| Bodyweight+ | `/bodyweight-plus/` | `/bodyweight-plus/privacy/` | `~/repos/muskelmuskel` |
| JasperSleep | `/jaspersleep/` | `/jaspersleep/privacy/` | `~/repos/babyphone` |

All six are marked **in development**. Drop the `<span class="badge">` line from
an app's page (and from its card in `index.html`) when it ships.

## Adding an app

1. `mkdir -p <slug>/privacy`
2. Copy the two HTML files from the closest existing app and rewrite the content.
3. Add a card to `index.html`.

## Working on it

```sh
nix develop          # or: direnv allow
python3 -m http.server 8000
```

Note that `python3 -m http.server` serves relative to the current directory, so
the absolute `/style.css` links resolve correctly only when it is started from
the repository root — which is also how GitHub Pages serves it.

## Deploying

Push to `main`. GitHub Pages serves the branch root; there is no workflow and
nothing to build.
