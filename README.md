# Nikolay Malkovsky Personal Site

This repository contains a Quarto-based personal website and bilingual blog for
Nikolay Malkovsky. The site has separate English and Russian Quarto projects
that are rendered into a shared `_site/` output directory.

## Languages

- English content: `en/`
- Russian content: `ru/`
- Generated output: `_site/`

The English and Russian versions have separate navigation, metadata, pages, and
blog posts. Blog posts are paired by date and slug, but each language has its
own `index.qmd`.

## Project Structure

```text
blog/
├── en/
│   ├── _quarto.yml
│   ├── index.qmd
│   ├── about.qmd
│   ├── contact.qmd
│   ├── resume.qmd
│   ├── publications.qmd
│   ├── blog/
│   │   ├── index.qmd
│   │   └── posts/
│   │       ├── _metadata.yml
│   │       └── YYYY-MM-DD_slug/
│   │           ├── index.qmd
│   │           └── thumbnail.png
│   └── projects/
│       └── index.qmd
├── ru/
│   ├── _quarto.yml
│   ├── index.qmd
│   ├── about.qmd
│   ├── contact.qmd
│   ├── resume.qmd
│   ├── publications.qmd
│   ├── blog/
│   │   ├── index.qmd
│   │   └── posts/
│   │       ├── _metadata.yml
│   │       └── YYYY-MM-DD_slug/
│   │           ├── index.qmd
│   │           └── thumbnail.png
│   └── projects/
│       └── index.qmd
├── images/                  # Shared images
├── styles/                  # Shared SCSS
├── cv.tex                   # CV source
├── index.html               # Root language selector
├── build.sh                 # Linux/macOS build script
├── build.bat                # Windows build script
└── _site/                   # Generated output, do not edit by hand
```

## Build

Requirements:

- Quarto
- Python/Jupyter only if a post uses executable notebook-style content
- TinyTeX/LaTeX only for pages or assets that require PDF/TeX rendering

Linux/macOS:

```sh
./build.sh
```

Windows:

```bat
build.bat
```

Manual build:

```sh
cd en
quarto render
cd ../ru
quarto render
cd ..
cp index.html _site/index.html
cp -r images _site
```

The GitHub Pages workflow in `.github/workflows/publish_site.yml` builds the
site in the official Quarto container and uploads `_site/`.

The Unix build script also installs the Quarto Font Awesome extension if needed,
copies shared `images/` into `_site/`, and copies `cv.pdf` into `_site/en/`.

## Adding a Blog Post

Create matching folders for both languages:

```text
en/blog/posts/YYYY-MM-DD_slug/
ru/blog/posts/YYYY-MM-DD_slug/
```

Each folder should contain an `index.qmd`. Put post-local images and data next
to the post, either directly in the folder or in a local `images/` subfolder.

Use this front matter shape:

```yaml
---
title: "Your Title"
description: "1-2 sentence summary of the post."
author: "Nikolay Malkovsky"
date: "YYYY-MM-DD"
categories: [tag1, tag2, tag3]
image: "thumbnail.png"
draft: false
---
```

For Russian posts, use Russian title, description, and body text. Existing
posts commonly use `author: "Николай Мальковский"` in Russian articles.

Keep the same date and slug in both languages. Keep content language-specific:
do not mix English and Russian in one post unless quoting or showing an example.

## Content Conventions

- Write posts as Quarto Markdown (`.qmd`).
- Use fenced code blocks with language tags, for example `sh`, `python`, or
  `cpp`.
- Prefer relative paths for assets.
- Use a `thumbnail.png` or equivalent image referenced by `image:` for listing
  cards.
- Keep generated files out of source edits: do not manually edit `_site/`,
  `.quarto/`, Jupyter caches, or freeze output.

## Main Configuration Files

- `en/_quarto.yml` - English site configuration
- `ru/_quarto.yml` - Russian site configuration
- `styles/custom.scss` - shared styling
- `en/blog/posts/_metadata.yml` - metadata defaults for English posts
- `ru/blog/posts/_metadata.yml` - metadata defaults for Russian posts

The root `_quarto.yml` exists, but the normal site build uses the language-level
Quarto projects.

## Deployment

The published artifact is `_site/`. The default GitHub Actions workflow builds
on pushes to `main` and deploys `_site/` to GitHub Pages.

For manual hosting, build the site and upload the contents of `_site/`.
