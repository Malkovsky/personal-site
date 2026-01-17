# Bilingual Personal Website & Blog

A professional personal website and blog built with [Quarto](https://quarto.org), supporting both English and Russian languages.

## 🌍 Multilingual Support

This website is available in two languages:
- 🇬🇧 English (`/en`)
- 🇷🇺 Russian (`/ru`)

Each language version is completely separate with its own navigation, content, and configuration.

## 📁 Project Structure

```
blog/
├── en/                      # English content
│   ├── _quarto.yml          # English site configuration
│   ├── index.qmd            # English homepage
│   ├── about.qmd
│   ├── contact.qmd
│   ├── resume.qmd
│   ├── publications.qmd
│   ├── blog/
│   │   ├── index.qmd
│   │   └── posts/           # Blog posts (shared between languages)
│   └── projects/
│       └── index.qmd
├── ru/                      # Russian content
│   ├── _quarto.yml          # Russian site configuration
│   ├── index.qmd            # Russian homepage
│   ├── about.qmd
│   ├── contact.qmd
│   ├── resume.qmd
│   ├── publications.qmd
│   ├── blog/
│   │   └── index.qmd
│   └── projects/
│       └── index.qmd
├── _site/                   # Generated site output
│   ├── index.html           # Language selector page
│   ├── en/                  # English site
│   └── ru/                  # Russian site
├── images/                  # Shared images
├── styles/                  # Shared styles
├── index.html               # Root language selector
├── build.bat                # Windows build script
├── build.sh                 # Unix/Linux/Mac build script
└── README.md
```

## 🚀 Building the Site

### Windows
```bash
build.bat
```

### Unix/Linux/Mac
```bash
chmod +x build.sh
./build.sh
```

### Manual Build
```bash
# Build English version
cd en
quarto render
cd ..

# Build Russian version
cd ru
quarto render
cd ..

# Copy language selector
copy index.html _site\index.html    # Windows
cp index.html _site/index.html      # Unix/Mac
```

## 🎨 Customization

### Updating Content

1. **English content**: Edit files in the `en/` directory
2. **Russian content**: Edit files in the `ru/` directory
3. **Shared resources**: Images go in `images/`, styles in `styles/`

### Configuration

Each language has its own `_quarto.yml` file:
- `en/_quarto.yml` - English site settings
- `ru/_quarto.yml` - Russian site settings

### Language Switcher

The language switcher appears in the top-right navigation:
- English site shows: 🇷🇺 RU (links to Russian version)
- Russian site shows: 🇬🇧 EN (links to English version)

## 📝 Adding Blog Posts

Blog posts are stored in `en/blog/posts/` and are shared between both language versions. The blog index pages (`en/blog/index.qmd` and `ru/blog/index.qmd`) display the same posts with localized titles and descriptions.

To add a new blog post:

1. Create a new directory in `en/blog/posts/YYYY-MM-DD-post-name/`
2. Add your content in `index.qmd`
3. The post will appear in both language versions

## 🌐 Deployment

The built site is in the `_site` directory. Deploy this directory to your web hosting service:

- **GitHub Pages**: Push `_site` to `gh-pages` branch
- **Netlify**: Connect repository and set build command to `build.bat` or `build.sh`
- **Vercel**: Similar to Netlify
- **Custom hosting**: Upload `_site` directory via FTP/SFTP

## 📄 Features

- ✅ Fully responsive design
- ✅ Dark/light theme support
- ✅ Blog with Jupyter notebook support
- ✅ Projects showcase
- ✅ Publications list
- ✅ Resume/CV page
- ✅ Contact information
- ✅ Search functionality (per language)
- ✅ RSS feeds (per language)
- ✅ Language switcher in navigation
- ✅ SEO optimized

## 🔧 Requirements

- [Quarto](https://quarto.org/docs/get-started/) (latest version)
- Python (for Jupyter notebook support, optional)
- R (optional)

## 📖 Documentation

For more information about Quarto websites, visit:
- [Quarto Websites Guide](https://quarto.org/docs/websites/)
- [Quarto Publishing Guide](https://quarto.org/docs/publishing/)

## 🤝 Contributing

Feel free to customize this template for your own use!

## 📧 Contact

Update the contact information in:
- `en/contact.qmd`
- `ru/contact.qmd`
- Both `_quarto.yml` files

## 📄 License

This template is free to use and modify for your personal website.
