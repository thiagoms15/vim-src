; Keep inline Markdown parsing for render-markdown, but do not inject fenced code
; block languages. The fenced-code injections are what trigger the range() crash.

((inline) @injection.content
  (#set! injection.language "markdown_inline"))
