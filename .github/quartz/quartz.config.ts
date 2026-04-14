import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

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
      typography: {
        header: "Georgia, 'Times New Roman', serif",
        body: "system-ui, -apple-system, sans-serif",
        code: "'JetBrains Mono', 'Fira Code', monospace",
      },
      colors: {
        lightMode: {
          light: "#f4f1eb",
          lightgray: "#c8bfa8",
          gray: "#6a5a3a",
          darkgray: "#2a1f0e",
          dark: "#1c3a18",
          secondary: "#3a5c2e",
          tertiary: "#2d9fb5",
          highlight: "rgba(90,140,62,0.10)",
          textHighlight: "rgba(168,200,120,0.35)",
        },
        darkMode: {
          light: "#121e0f",
          lightgray: "#1e3318",
          gray: "#6a8a5a",
          darkgray: "#c8dab0",
          dark: "#e8f0d4",
          secondary: "#8faa7a",
          tertiary: "#7ecfde",
          highlight: "rgba(143,170,122,0.15)",
          textHighlight: "rgba(168,200,120,0.25)",
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
