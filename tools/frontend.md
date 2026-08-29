# Frontend Tools

## In the browser

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [React DevTools](https://react.dev/learn/react-developer-tools) / [Vue DevTools](https://devtools.vuejs.org/) | Free | The component tree, props and state inspection, and a profiler | Debug framework state without many console.log statements |
| [Lighthouse](https://developer.chrome.com/docs/lighthouse) | Free | A performance, accessibility, and SEO audit built into Chrome DevTools | It gives an objective, repeatable score for a PR. This is better than a subjective opinion |
| [axe DevTools](https://www.deque.com/axe/devtools/) | Freemium | An accessibility scanner | It finds the 40% of accessibility issues that machines can detect. Run it before a human audit |
| [Responsively](https://responsively.app/) | Free | Previews a page across many device sizes at the same time | One reload shows every breakpoint |

## Build, test, develop

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Vite](https://vitejs.dev/) | Free | A dev server and bundler with instant HMR | The default choice to start a frontend project. Feedback loops take less than one second |
| [Playwright](https://playwright.dev/) | Free | Cross-browser end-to-end testing, a trace viewer, and codegen | If an E2E test fails, the trace viewer shows a video, a DOM snapshot, and a network log of the cause |
| [Storybook](https://storybook.js.org/) | Free | Builds and tests components in isolation. It is also a current component catalog | Build and review components without a start of the whole app. The catalog also serves as team documentation |
| [typesim](https://typesim.pcstyle.dev/) | Free | An open-source simulator that types text with typos, self-corrections, and variable pauses | Paste tests do not find timing bugs. Use it to stress-test input fields and real-time validation |
| [Lucid Typer](https://www.lucidtyper.com/) | Freemium | Types pasted text at human speed with mistakes, corrections, and fatigue simulation (macOS, Windows) | Reproduce timing-sensitive input bugs. The fatigue mode covers long-session tests that manual QA skips |
| [ESLint](https://eslint.org/) + [Prettier](https://prettier.io/) | Free | A linter plus an opinionated formatter | It stops style debates. Every diff shows real changes, not whitespace |
| [TypeScript](https://www.typescriptlang.org/) | Free | Typed JavaScript | Many possible production bugs become editor warnings instead |

## Reference & analysis

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Can I use](https://caniuse.com/) | Free (web) | Browser support tables for web features | A 5-second check before you use a new API |
| [Bundlephobia](https://bundlephobia.com/) | Free (web) | Shows the cost (size, download time) of an npm package | Check the size of a dependency before `npm install`, not after a performance regression |
| [Figma](https://www.figma.com/) | Freemium | Design and dev handoff (inspect mode, tokens) | Read real padding and color values from the design. Do not estimate them from screenshots. To turn a design into a working prototype, see [Figma Make](ai.md) |
