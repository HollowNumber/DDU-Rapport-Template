#import "./lib/recursive_count.typ": *

#let rapport(
  titel: "",
  undertitel: "",
  sidehoved: [],
  abstract: [],
  forfatter: (),
  vejleder: (),
  logo: none,
  periode: "",
  toc: true,
  tof: false,
  tot: false,
  acknowledgements: [],
  body,
) = {
  // Indstil dokumentets grundlæggende egenskaber.
  set document(author: forfatter.map(a => a.name), title: titel)
  set text(font: "arial", lang: "da", ligatures: true)
  show heading: set text(font: "Neo Sans Pro", fill: rgb(50, 55, 152))
  show raw: set text(font: "Monaspace Neon")
  set smartquote(quotes: "»«")
  set page(numbering: "I", number-align: right)
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")


  show figure: set block(breakable: true)
  
  // Indsæt indgående subheadings, begyndende på niveau 3.
  

  show quote: it => {
    layout(size => { 
      style(styles => {
        let (height, width) = measure(block(width: size.width, it.body),styles)
        let gridContent = (
          [#pad(line(
            angle: 90deg, stroke: 1pt + rgb(50, 55, 152),
            length: height
          ))],
          [#it.body]
        )

        if it.has("block")  {
          if it.has("attribution") {  
            let attribution = it.attribution 
            // Add horziontal line to the left of the quote
            gridContent.push([])
            gridContent.push([#align(end)[#v(-0.2em)#h(width)--- #text(0.8em, attribution)]])
          }
            grid(columns: 2, ..gridContent)
        } else {
          ["#it.body"]
        }
      })
    })
  }

  // titel side.
  // Siden kan indeholde et logo, hvis du angiver et logo med `logo: "logo.png"`.
  // fjern header
  v(5.6fr)
  if logo != none {
    align(center, image(logo, width: 75%))
  }
  v(9.6fr)

  text(2em, weight: 700, [*#titel*: ])
  text(1.5em, weight: 600, undertitel)
  
  pad(
    top: 0.5em,
    right: 20%,
    [Fra #periode]
  )
  v(-0.8em)
  line(length: 75%, stroke: rgb(50, 55, 152))

  // forfatter information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, forfatter.len()),
      gutter: 1em,
      ..forfatter.map(author => align(start)[
        *#author.name* \
        #text(0.8em, author.affiliation)
      ]),
    ),
  )
  v(1.5em)
  // vejleder information.
  [#if vejleder.len() < 2 [*Vejleder*: ] else [*Vejledere*: ]] 
  v(-0.8em)
  line(length: 25%, stroke: rgb(50, 55, 152))
  pad(
    top: 0.1em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, vejleder.len()),
      gutter: 1em,
      ..vejleder.map(teacher => align(start)[
        *#teacher.name * (#text(0.75em, teacher.lectio)) \
        #text(0.8em, teacher.affiliation)
      ]),
    ))
  v(2.4fr)
  let anslag = recursive_count(body) 
  [*Anslag*: #anslag #text(0.75em,[(svarende til #calc.floor(recursive_count(body) / 2400) ns)])]
  v(3fr)
  // Underskrift
  pad(
    top: 0.7em,
    right: 20%,
    align(start)[
    #grid(
      columns: (1fr,) * calc.min(3, forfatter.len()),
      gutter: 1em,
      ..forfatter.map(author => align(center)[
        #text(0.75em, [*Underskrift*]): #box(width: 1fr, repeat[\_])
      ])
     )
    ],
  )


  show page: set page(header: sidehoved)
  pagebreak()

  // Abstract.
if abstract != [] {
  v(1fr)
  align(center)[
    #heading(
      outlined: false,
      numbering: none,
      text(0.85em, smallcaps[Resumé]),
    )
    #abstract
  ]
  v(1.618fr)
  pagebreak()
}

// Acknowledgements.
if acknowledgements != [] {
  
    heading(outlined: false,numbering: none,text(0.85em, smallcaps[Ankerkendelser]))
    // Authors
    v(1em)
    [#if forfatter.len() > 1 [*Forfattere*: ] else [*Forfatter*: ]]
    v(-0.8em)
    line(length: 25%, stroke: rgb(50, 55, 152))
    
    for dict in forfatter {
      parbreak()
      [*#dict.name*, #text(0.75em, dict.affiliation_short)]
    }    
    v(1em)

    par(acknowledgements, justify: true)
   
  
  v(1.618fr)
  pagebreak()
}

show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}

// Table of contents.
if toc {
  v(5em)
  outline(depth: 3, indent: auto)
  pagebreak()
}

if tof {
  v(5em)
  outline(
    title: [Figurer],
    target: figure.where(kind: image).or(figure.where(kind: table)).or(figure.where(kind: raw))
    )
  pagebreak()
}

if tot {
  v(5em)
  outline(
    title: [Tabeller],
    target: figure.where(kind: table)
    )
  pagebreak()
}

  
  // Glossary.
  v(5em)
  include "chapters/ordliste.typ"
  pagebreak()


  // Main body.
  set par(justify: true, first-line-indent: 1em)
  set page(columns: 2, numbering: "1 аf 1", number-align: right)
  counter(page).update(1) 

  body
}
