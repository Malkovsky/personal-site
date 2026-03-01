# Project Agents Guide

Primary purpose: agents assist with writing new blog articles for this Quarto-based, bilingual (EN/RU) personal site.

## Repository context
- Content is language-specific and lives in `en/` and `ru/`.
- Blog posts are Quarto documents under `en/blog/posts/` and `ru/blog/posts/`.
- Output is generated into `_site/` (do not edit by hand).
- Shared styles live in `styles/` and shared assets in `images/`.

## When creating a new blog post
1. Create a new folder per language:
   - `en/blog/posts/YYYY-MM-DD_slug/`
   - `ru/blog/posts/YYYY-MM-DD_slug/`
   Keep the same date and slug for both languages.
2. Add `index.qmd` in each folder and local assets (images, data) inside the same post folder (or a subfolder like `images/`).
3. Use a `thumbnail.png` (or other image) for the post card and reference it via `image:` in front matter.
4. Keep content language-specific (no mixed languages inside one post).
5. Avoid editing generated content in `_site/` or `.quarto/`.

## Required front matter (template)
Use this structure at the top of each `index.qmd`:

```yaml
---
title: "Your Title"
description: "1–2 sentence summary of the post."
author: "Nikolay Malkovsky"
date: "YYYY-MM-DD"
categories: [tag1, tag2, tag3]
image: "thumbnail.png"
draft: false
---
```

## Content conventions
- Use Quarto Markdown (`.qmd`) with headings, code blocks, and callouts when helpful.
- Keep titles and descriptions concise and aligned between EN/RU versions.
- Prefer relative paths for assets; keep them within the post directory.
- If you include code or commands, use fenced code blocks with a language tag (e.g., `sh`, `python`).

## Quality bar
- Provide a clear narrative arc: problem → approach → result/insight.
- Include at least one visual or code example when relevant.
- Keep tone professional and technical; avoid filler.

## What to avoid
- Do not edit files in `_site/` or `.quarto/`.
- Do not change site configuration unless explicitly requested.
- Do not remove existing posts or assets.
