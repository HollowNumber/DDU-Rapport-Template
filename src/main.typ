#import "format.typ": *

// sidehoved
// INDSÆT NAVN, FAG, OG DATO
#set page(
  "a4",
)

// to customize this template and discover how it works.
#show: rapport.with(
  // indsæt Titel
  titel: "TITEL",
  undertitel: "UNDERTITEL",
  sidehoved: [
    #set text(8pt)
    Author names
    #h(1fr) Digital Design og Udvkilking
    #h(1fr) School name \
    affiliation
    #h(2fr) Dato til dato
  ],
  forfatter: (
    // Dit navn og Klasse
    (name: "Author name 1", affiliation: "Author affiliation", affiliation_short: "affiliation short"),
    (name: "Author name 2", affiliation: "Author affiliation", affiliation_short: "affiliation short"),
  ),
  vejleder: (
    (name: "Name", affiliation: "affiliation", lectio: "nme"),
    (name: "name", affiliation: "affiliation", lectio: "name"),
  ),
  // indsæt dit forside billede (eller fjern)
  periode: "7. november til 12. december",

  // Indsæt dit resumé efter kolonet, omsluttet af parenteser.
  // Eksempel: `abstract: [Her er min abstract]`
  abstract: lorem(300),
  tof: true,
  acknowledgements: [
    
  ],
  tot: false,
  logo: "out.jpg"
)

#include "chapters/projektbeskrivelse.typ"
#include "chapters/hovedafsnit.typ"
#include "chapters/diskussion.typ"
#include "chapters/konklusion.typ"

#pagebreak()
#set page(columns: 1)
#bibliography("bibliografi.yml")

#pagebreak()
#include "chapters/appendix.typ"
