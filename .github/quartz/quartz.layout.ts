import { PageLayout, SharedLayout } from "./quartz/cfg"
import * as Component from "./quartz/components"
import { jsx } from "preact/jsx-runtime" 

// components shared across all pages
export const sharedPageComponents: SharedLayout = {
  head: Component.Head(),
  header: [
    Component.DocumentContent({ 
      targetSlug: "assets/fragments/global-header", 
    }),
  ],
  afterBody: [
    Component.ConditionalRender({
      component: Component.RecentNotes({
        title: "Recent Notes",
        limit: 5,
        filter: (f) => {
          return !(f.slug?.startsWith("_assets/") || f.slug?.startsWith("_templates/") || f.slug?.startsWith("Internal/"))
        },
      }),
      condition: (page) => page.fileData.slug == "index",
    }),
    Component.DocumentContent({targetSlug: "assets/fragments/global-footer", }),
  ],
  footer: Component.CSFooter(),
}

// components for pages that display a single page
export const defaultContentPageLayout: PageLayout = {
  beforeBody: [
    Component.ConditionalRender({
      component: Component.Breadcrumbs({showCurrentPage: false,}),
      condition: (page) => page.fileData.slug !== "index",
    }),
    Component.ConditionalRender({
      component: Component.ArticleTitle(),
      condition: (page) => page.fileData.frontmatter?.layout !== "landing-page",
    }),
    Component.ConditionalRender({
      component: Component.ContentMeta(),
      condition: (page) => page.fileData.frontmatter?.layout !== "landing-page",
    }),
    Component.ConditionalRender({
      component: Component.TagList(),
      condition: (page) => page.fileData.frontmatter?.layout !== "landing-page",
    }),    
  ],
  left: [
    Component.ConditionalRender({
      component: Component.Logo(),
      condition: (page) => page.fileData.frontmatter?.layout !== "landing-page",
    }),
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        {
          Component: Component.Search(),
          grow: true,
        },
        { Component: Component.Darkmode() },
        { Component: Component.ReaderMode() },
      ],
    }),
    Component.Explorer({
      title: "Directory",
      folderClickBehavior: "link",
      filterFn: (node) => {
        const omit = new Set(["_assets", "internal", "_templates"])
        return !omit.has(node.displayName.toLowerCase())
      },
    })
  ],
  right: [
    Component.DesktopOnly((props) => {
      const isLandingPage = props.fileData.frontmatter?.layout === "landing-page"
      if (isLandingPage) return null
      return jsx(props.displayClass ?? "div", {
        children: [
          Component.TableOfContents()(props),
        ],
      })
    }),
  ],
}

// components for pages that display lists of pages
export const defaultListPageLayout: PageLayout = {
  beforeBody: [
    Component.ConditionalRender({
      component: Component.Breadcrumbs({showCurrentPage: false,}),
      condition: (page) => page.fileData.slug !== "index",
    }),
    Component.ArticleTitle(),
    Component.ContentMeta(),
  ],
  left: [
    Component.Logo(),
    Component.MobileOnly(Component.Spacer()),
    Component.Flex({
      components: [
        {
          Component: Component.Search(),
          grow: true,
        },
        { Component: Component.Darkmode() },
        { Component: Component.ReaderMode() },
      ],
    }),
    Component.Explorer({
      title: "Directory",
      folderClickBehavior: "link",
      filterFn: (node) => {
        const omit = new Set(["_assets", "internal", "_templates"])
        return !omit.has(node.displayName.toLowerCase())
      },
    })
  ],
  right: [],
}
