# Support & Debugging Tools

Use these tools when production is down, the heap grows, and nobody knows the cause. Install them before an incident occurs.

## System & process (Windows)

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Sysinternals Suite](https://learn.microsoft.com/en-us/sysinternals/) (ProcMon, ProcExp, TCPView…) | Free | Shows file, registry, and network activity for each Windows process | ProcMon shows what an app does in reality. It finds unknown file locks, missing configs, and permission errors in minutes |
| [PerfView](https://github.com/microsoft/perfview) | Free | .NET CPU, allocation, and GC profiling from ETW traces | A free tool to find why a service uses too much CPU. It is safe to run on production |
| [WinDbg](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/) + [dotnet-dump](https://learn.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-dump) | Free | Post-mortem analysis of crash and hang dumps | If a process died and you have only a dump, use these tools to find the cause |
| [dotTrace / dotMemory](https://www.jetbrains.com/profiler/) | Paid | .NET performance and memory profilers | An easy way to find which method is slow and which reference keeps an object graph alive |

## Network & HTTP

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Fiddler](https://www.telerik.com/fiddler) / [mitmproxy](https://mitmproxy.org/) | Freemium / Free | Intercepts and inspects HTTPS traffic | See the real request that the app sent. Do not trust what the code appears to send |
| [Wireshark](https://www.wireshark.org/) | Free | Packet-level network analysis | Use it for the layer below HTTP: DNS problems, TLS handshake failures, and TCP resets |
| [curl](https://curl.se/) + [jq](https://jqlang.github.io/jq/) | Free | Scriptable HTTP requests and JSON processing | The universal reproduction case. One curl command in a ticket explains more than 10 paragraphs |

## Logs & queries

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) | Free | Very fast recursive text search | It searches a 2 GB log directory in seconds |
| [KQL / Azure Monitor](https://learn.microsoft.com/en-us/kusto/query/) | Paid (usage) | A query language over App Insights / Log Analytics | KQL skill gives a large support advantage. One query joins requests, exceptions, and dependencies |
| [Seq](https://datalust.co/seq) | Free single-user | A structured log server | Follow one correlation ID through a full distributed request |
| [lnav](https://lnav.org/) | Free | A terminal log viewer that detects formats and merges files by timestamp | It tails, merges, and filters log files, and runs SQL over them. No setup is necessary |

## The debugging discipline

Tools do not debug. Process does:

1. **Reproduce the bug before you fix it.** If you cannot reproduce a bug, you cannot verify the fix.
2. **Change one variable at a time.** Two changes at the same time give zero information.
3. **Read the actual error message.** Then read it again. The message often contains the answer.
4. Write the result down. Use the [Post-Mortem template](../templates/Post-Mortem-Template.md) for incidents. Use [skills/flaky-test-diagnosis](../skills/flaky-test-diagnosis/SKILL.md) for unstable tests.
