#import "@preview/glossarium:0.2.3": make-glossary, print-glossary, gls, glspl 
#set page(columns: 1)

#heading("Ordliste", numbering: none)
#print-glossary((
  (
    key: "moscow-method",
    short: "MoSCoW",
    long: "MoSCoW metoden",
    desc: [
      MoSCoW metoden er en prioriteringsmetode, der bruges til at prioritere krav i et projekt.
      Den er delt op i fire kategorier: *Must Have* --- disse krav er de krav, der er nødvendige for at projektet kan blive en succes. *Should Have* --- disse krav er de krav, der er vigtige for at projektet kan blive en succes. *Could Have* --- disse krav er de krav, der er ønskelige for at projektet kan blive en succes. *Won't Have* --- disse krav er de krav, der ikke er nødvendige for at projektet kan blive en succes.
    ]
  ),
  (
    key: "bartles-taksonomi",
    short: "Bartle's taksonomi",
    long: "Bartle's taksonomi af spiller typer",
    desc: 
    [
      Bartles taksonomi af spiller typer er en model, der beskriver fire forskellige typer af spillere. Disse fire spiller typer leder alle sammen efter noget forskelligt i de spil, de spiller. *Explorers* --- disse spillere er interesserede i at udforske spillets verden og finde nye ting. *Socializers* --- disse spillere er interesserede i at interagere med andre spillere. *Achievers* --- disse spillere er interesserede i at opnå mål i spillet. *Killers* --- disse spillere er interesserede i at konkurrere med andre spillere.
    ]
  ),
  (
    key: "mda-framework",
    short: "MDA framework",
    long: "Mechanics-Dynamics-Aesthetics framework",
    desc: [
      MDA frameworket er en model, der beskriver hvordan spil kan blive analyseret. Den er delt op i tre kategorier: *Mechanics* --- disse er de regler, der er i spillet. *Dynamics* --- disse er de handlinger, der kan udføres i spillet. *Aesthetics* --- disse er de følelser, der opstår hos spilleren, når de spiller spillet.
    ]

  ),
))