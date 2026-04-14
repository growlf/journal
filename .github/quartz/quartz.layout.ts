import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"

// components shared across all pages
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [
    Component.PageTitle(),
    Component.Search(),
    Component.Darkmode(),
    Component.DesktopOnly(Component.Explorer({
      title: "Menu",
      useSavedState: true,
      sortFn: (a, b) => {
        if ((!a.file && !b.file) || (a.file && b.file)) {
          return a.displayName.localeCompare(b.displayName)
        }
        if (a.file && !b.file) return 1
        else return -1
      },
      filterFn: (node) => {
        const omit = new Set(["_assets", "internal"])
        return !omit.has(node.displayName?.toLowerCase() ?? "")
      },
    })),
  ],
  afterBody: [],
  footer: Component.Footer({
    links: {
      "GitHub": "https://github.com/growlf/journal",
    },
  }),
}

// components for pages that display a single page (e.g. a single note)
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    Component.Breadcrumbs(),
    Component.ArticleTitle(),
    Component.ContentMeta(),
    Component.TagList(),
  ],
  left: [], // Sidebars are now purely for forest atmosphere and supplemental info
  right: [
    Component.Graph(),
    Component.DesktopOnly(Component.TableOfContents()),
    Component.Backlinks(),
  ],
}

// components for pages that display lists of pages  (e.g. tags or folders)
export const defaultListPageLayout: PageLayout = {
  beforeBody: [Component.Breadcrumbs(), Component.ArticleTitle(), Component.ContentMeta()],
  left: [],
  right: [],
}
