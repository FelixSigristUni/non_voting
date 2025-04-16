## Empirische Strategie und Hypothesenübersicht (Bühlmann-Style)

### Ziel der Analyse

Mit einer multinomialen logistischen Regression sollen verschiedene Typen von Nichtwählenden (basierend auf Bühlmann et al. 2003) und deren Unterscheidbarkeit gegenüber Wählenden empirisch überprüft werden. Die Arbeit nutzt den SELECTS Paneldatensatz 2019–2023 und fokussiert auf Personen, die bei beiden Nationalratswahlen nicht gewählt haben. Ziel ist es, diese "dauerhaft Nichtwählenden" anhand ihrer individuellen Merkmale zu typisieren und deren Gruppenzugehörigkeit zu erklären.

### Schritt 1: Definition der abhängigen Variablen

Die abhängige Variable ist nominalskaliert und umfasst drei theoretisch gebündelte Gruppen, abgeleitet aus Bühlmann et al. (2003):
  
  1. **Apathische Nichtwählende** (politisch desinteressiert, geringe Kompetenz, wenig soziale Integration – vereint politisch Desinteressierte und Inkompetente)
2. **Protestierende Nichtwählende** (unzufrieden mit Politik und System, kritische Haltung – entspricht den Protestierenden und Politikverdrossenen)
3. **Zufriedene oder Alternativ-Partizipierende Nichtwählende** (sehen keinen Bedarf zu wählen, sind zufrieden mit dem System oder nutzen andere Partizipationsformen – entspricht Alternativ-Partizipierenden und Sozial Isolierten)

---
  
  ### Schritt 2: Zentrale Hypothesen
  
  #### Hypothese 1 (Politisches Interesse und Kompetenz)
  - **Apathische Nichtwählende** zeigen deutlich geringeres politisches Interesse und weniger Wissen über Politik als andere Gruppen.

#### Hypothese 2 (Systemzufriedenheit und Vertrauen)
- **Protestierende Nichtwählende** weisen geringes Vertrauen in politische Institutionen und niedrige Systemzufriedenheit auf.
- **Zufriedene Nichtwählende** sind mit der Demokratie und den politischen Verhältnissen weitgehend zufrieden.

#### Hypothese 3 (Sozioökonomischer Status)
- **Apathische Nichtwählende** verfügen über einen niedrigeren sozioökonomischen Status.
- **Zufriedene** unterscheiden sich kaum von der Gesamtbevölkerung in Bildung und Einkommen.

#### Hypothese 4 (Soziale und ideelle Ressourcen)
- **Apathische** sind weniger sozial integriert und haben ein geringeres Gefühl politischer Wirksamkeit.
- **Protestierende** fühlen sich zwar politisch wirksam, aber nicht repräsentiert.

#### Hypothese 5 (Parteinähe und politisches Selbstverständnis)
- **Apathische** haben kaum Parteinähe.
- **Protestierende** fühlen sich politisch verortet, lehnen aber bestehende Parteien ab.
- **Zufriedene** zeigen moderate bis geringe Parteinähe, ohne explizite Ablehnung.

---
  
  ### Schritt 3: Operationalisierung der Variablen
  
  **Unabhängige Variablen (nach Bühlmann-Faktorenstruktur):**
  - **Faktor 1:** Politisches Interesse, Diskussion, Wahlbeteiligung
- **Faktor 2:** Politische Kompetenz (Kenntnis von Prozessen, Kandidierenden, Grundwissen)
- **Faktor 3:** Systemzufriedenheit (Vertrauen in Institutionen, Zufriedenheit mit Demokratie)
- **Faktor 4:** Sozioökonomischer Status, Arbeitsstatus, ökonomische Zufriedenheit
- **Zusatz:** Parteinähe, subjektives Gefühl politischer Wirksamkeit

---
  
  ### Schritt 4: Analyse
  
  Durchführung der multinomialen logistischen Regression, wobei eine der Gruppen (z. B. Apathische) als Referenzkategorie fungiert.

- Modell 1: Politisches Interesse + Systemzufriedenheit
- Modell 2: Modell 1 + politische Kompetenz + sozioökonomischer Status
- Modell 3: Modell 2 + soziale Integration, politische Wirksamkeit, Parteinähe

Vergleich der Modellgüte anhand von:
  - **Akaike Information Criterion (AIC)**
  - **Bayesian Information Criterion (BIC)**
  - **Pseudo-R² (McFadden)**
  
  ---
  
  ### Schritt 5: Ergebnisinterpretation
  
  Die Ergebnisse werden verwendet, um:
  - die erweiterte Typologie auf Basis von Bühlmann et al. (2003) empirisch zu überprüfen,
- Unterschiede zwischen den Gruppen entlang zentraler Erklärungsfaktoren herauszuarbeiten,
- konkrete Hinweise zu liefern, wie insbesondere potenziell mobilisierbare Gruppen (z. B. zufriedene Alternativ-Partizipierende) politisch besser erreicht werden könnten.

---
  
  Diese Vorgehensweise kombiniert einen empirisch validierten Typenansatz mit einer theoriebasierten Erklärung dauerhafter Nichtwahl und eignet sich besonders gut zur Analyse individueller Wahlabstinenz im Schweizer Kontext.

