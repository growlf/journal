import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4.0 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "The Netyeti's Journal",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "plausible",
    },
    locale: "en-US",
    baseUrl: "growlf.github.io/journal",
    ignorePatterns: ["private", "_templates", ".obsidian", ".gemini", ".git"],
    defaultDateType: "created",
    theme: {
      fontOrigin: "hosted",
      cdnCaching: true,
      //typography: {
      //  header: "Workbench",
      //  body: "Walter Turncoat",
      //  code: "IBM Plex Mono",
      //},
      typography: {
        header: "Georgia, 'Times New Roman', serif",
        body: "system-ui, -apple-system, sans-serif",
        code: "'JetBrains Mono', 'Fira Code', monospace",
      },
      colors: {
        lightMode: {
          light: "#eeeeeeff",
          lightgray: "#dbdbdb",
          gray: "#59d75b",
          darkgray: "#464646ff",
          dark: "#00551a",
          secondary: "#037c29",
          tertiary: "#00bc3b",
          highlight: "#00ff8c26"
        },
        darkMode: {
          light: "#00282b",
          lightgray: "#355f3b",
          gray: "#006015",
          darkgray: "#a9a9a9;",
          dark: "#90ff90ff",
          secondary: "#29cb68",
          tertiary: "#8dffb3",
          highlight: "rgba(169, 143, 143, 0.15)",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        // ============================================================
        // NetYeti Forest Theme — drop this into your quartz.config.ts
        // Replace the entire `theme: { ... }` block with this.
        // ============================================================
        theme: {
          fontOrigin: "googleFonts",
          cdnCaching: true,
          typography: {
            header: "Playfair Display",   // serif — editorial, eye-catching headings
            body: "Inter",                 // clean, highly readable body text
            code: "JetBrains Mono",       // crisp monospace for code blocks
          },
          colors: {
            lightMode: {
              light: "#f4f1eb",           // Birchbark — warm off-white page background
              lightgray: "#c8bfa8",       // Driftwood — borders, dividers
              gray: "#6a5a3a",            // Bark — muted labels, secondary text
              darkgray: "#2a1f0e",        // Loam — primary body text
              dark: "#1c3a18",            // Deep Forest — headings, strong emphasis
              secondary: "#3a5c2e",       // Understory — links, active nav items
              tertiary: "#2d9fb5",        // Stream Mid — hover states, highlights
              highlight: "rgba(90,140,62,0.10)",   // Fern tint — search highlight
              textHighlight: "rgba(168,200,120,0.35)", // Meadow tint — text mark
            },
            darkMode: {
              light: "#121e0f",           // Night Forest — page background
              lightgray: "#1e3318",       // Shadow — borders, dividers
              gray: "#6a8a5a",            // Moonlit Bark — muted text
              darkgray: "#c8dab0",        // Pale Canopy — body text
              dark: "#e8f0d4",            // Mist — headings
              secondary: "#8faa7a",       // Sage — links, active nav
              tertiary: "#7ecfde",        // Stream Light — hover states
              highlight: "rgba(143,170,122,0.15)", // Sage tint — search highlight
              textHighlight: "rgba(168,200,120,0.25)", // Meadow tint
            },
          },
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config
