#let pigeonful(
  application-title: [志愿信息],
  entries: (:),
  notice-title: [待录取通知],
  notice-hint: [接受或拒绝待录取通知后，将无法更改。],
  notice-body: [],
  notifier: [],
  acceptance: [],
  width: 768pt,
) = {
  /// Block with specific line height
  let line-block(body, height: auto) = {
    block(height: height, align(horizon, body))
  }

  /// Outer box
  let border-block = block.with(width: 100%, stroke: rgb("#ccc"))

  set text(lang: "zh", font: "Microsoft YaHei", size: 14pt, cjk-latin-spacing: none)

  show: block.with(width: width)

  set block(spacing: 0pt)
  border-block(
    fill: rgb("#f9f9f9"),
    inset: 10pt,
  )[
    #line-block(height: 17.5pt, text(fill: rgb("#50aac2"), strong(application-title)))
  ]
  border-block(inset: 10pt)[
    #set text(overhang: false)
    #show grid.cell.where(x: 0): set text(fill: rgb("#65696E"))
    #show grid.cell.where(x: 1): set text(fill: rgb("#2B2E33"))
    #grid(
      columns: (38%, 59%),
      rows: 30.75pt,
      align: (right + horizon, left + horizon),
      column-gutter: 0.5em,
      ..for (k, v) in entries {
        ([#k：], [#v])
      }
    )
    #v(7.5pt)
  ]
  border-block(inset: 10pt)[
    #line-block(height: 16pt)[
      #text(fill: rgb("#c90"), strong(notice-title))
      #h(6pt)
      #text(fill: rgb("#93989E"), notice-hint)
    ]
  ]
  border-block(inset: 10pt)[
    #line-block(height: 22pt)[#text(fill: rgb("#848484"), notifier)]

    #block(inset: (top: 10.5pt, bottom: 20pt, x: 25.5pt))[
      #block(
        width: 100%,
        inset: (x: 13pt, y: 10pt),
        stroke: rgb("#b2e2ea"),
        fill: rgb("#e5f2f8"),
      )[
        #place(dx: 20pt, dy: -19pt)[
          #place[#text(fill: rgb("#b2e2ea"), size: 23pt)[#sym.diamond.filled]]
          #place(dy: 1.4pt)[#text(fill: rgb("#e5f2f8"), size: 23pt)[◆]]
        ]
        #v(3.5pt)
        #block[
          #set text(rgb("#2B2E33"))
          #set par(leading: 12pt)
          #notice-body
        ]
        #v(7pt)
        #align(center)[
          #block(inset: 10pt)[
            #block(stroke: rgb("#ccc"), radius: 4pt, inset: (x: 15pt))[
              #line-block(height: 28pt)[
                #text(fill: rgb("#007F00"))[#text(font: "Rei", size: 16pt)[] #acceptance]
              ]
              #v(4pt)
            ]
          ]
        ]
      ]
    ]
  ]
}
