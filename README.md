# apps.moritzwolf.com

Static landing pages for Moritz Wolf's apps, served by GitHub Pages at
<https://apps.moritzwolf.com>.

No build step. Every page is hand-written HTML sharing one stylesheet; what is
in this repository is exactly what is served.

## Layout

```
index.html              the Home Screen grid of app icons
style.css               the only stylesheet
icons/<app>.png         the app's real icon, 512px, copied from its source repo
CNAME                   the custom domain for GitHub Pages
.nojekyll               serve the files as-is, no Jekyll processing
<app>/index.html        one landing page per app
<app>/privacy/index.html  the privacy policy linked from App Store Connect
```

The index page is deliberately nothing but the icon grid — no title, no
copy — rendered the way iOS draws a Home Screen.

| App | Path | Privacy URL | Source repo |
| --- | --- | --- | --- |
| The Sheep | `/thesheep/` | `/thesheep/privacy/` | `~/repos/TheSheep` |
| Loggi | `/loggi/` | `/loggi/privacy/` | `~/repos/Loggi` |
| Time Delta | `/time-delta/` | `/time-delta/privacy/` | `~/repos/uhrtracker` |
| GeoDrone | `/geodrone/` | `/geodrone/privacy/` | `~/repos/dipul-ios` |
| Bodyweight+ | `/bodyweight-plus/` | `/bodyweight-plus/privacy/` | `~/repos/muskelmuskel` |
| JasperSleep | `/jaspersleep/` | `/jaspersleep/privacy/` | `~/repos/babyphone` |

All six are marked **in development**. Drop the `<span class="badge">` line from
an app's page when it ships.

## Adding an app

1. `mkdir -p <slug>/privacy`
2. Copy the two HTML files from the closest existing app and rewrite the content.
3. Copy the app's 1024px icon out of its `AppIcon.appiconset` and shrink it:
   `sips -Z 512 icon-1024.png --out icons/<slug>.png`
4. Add a tile to `index.html`.

Contact address on every page is `apps@moritzwolf.com`.

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
