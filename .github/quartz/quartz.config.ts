import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"
import * as Component from "./quartz/components"

const config: QuartzConfig = {
  configuration: {
    pageTitle: "The NetYeti's Journal",
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "plausible",
    },
    locale: "en-US",
    baseUrl: "growlf.github.io/journal",
    ignorePatterns: ["private", "_templates", ".obsidian", ".gemini", ".git", "_assets", "Internal"],
    defaultDateType: "created",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Rubik",
        body: "Source Sans Pro",
        code: "IBM Plex Mono",
      },
      colors: {
        lightMode: {
          light: "#fdfaf3",
          lightgray: "#d46329ff",
          gray: "#b8b8b8",
          darkgray: "#1a1f15",
          dark: "#2d5a27",
          secondary: "#2d5a27",
          tertiary: "#00ff8c",
          highlight: "rgba(0, 255, 140, 0.1)",
          textHighlight: "#fff23688",
        },
        darkMode: {
          light: "#020402",
          lightgray: "#d46329ff",
          gray: "#646464",
          darkgray: "#d4d4d4",
          dark: "#00ff8c",
          secondary: "#8faa7a",
          tertiary: "#00ff8c",
          highlight: "rgba(0, 255, 140, 0.15)",
          textHighlight: "rgba(0, 171, 197, 0.43)",
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
        theme: {
          light: "github-light",
          dark: "github-dark",
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
      Plugin.FolderPage({ pageBody: Component.Content() }),
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
