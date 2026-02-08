---
title: "Rubberduck+: Wenn dein AI-Assistent ein ganzes Beratungsteam wird"
date: 2026-02-08
draft: false
tags: ["melflin", "rubberduck", "advisory", "ai", "decision-making"]
---

# Rubberduck+: Wenn dein AI-Assistent ein ganzes Beratungsteam wird

*Stell dir vor, du hast nicht einen Berater – sondern sechs. Die miteinander diskutieren. Über dein Problem.*

---

## Das Problem mit Einzelmeinungen

Jeder kennt das: Du fragst einen Experten um Rat. Er gibt dir *seine* Perspektive. Gut gemeint, aber einseitig.

Der Optimist sieht nur Chancen.
Der Pessimist nur Risiken.
Der Techniker ignoriert den User.
Der User ignoriert die Technik.

Was wäre, wenn du **alle Perspektiven gleichzeitig** bekommen könntest – und sie sich auch noch gegenseitig herausfordern?

---

## Enter: Advisory Mode

Mit einem einfachen Trigger aktivierst du ein ganzes Team:

```
Advisory: Sollen wir auf Tailscale umsteigen für Remote-Zugriff?
```

Und dann passiert Magie:

---

### 🟢 AURORA (Der Optimist)
*"Das ist perfekt! Zero-Config VPN, WireGuard-basiert, funktioniert einfach. Du klappst den Laptop auf und bist connected."*

### 🔴 KRITIKOS (Der Skeptiker)
*"Noch ein Dienst mehr in der Kette. Was wenn Tailscale down ist? Haben wir einen Fallback?"*

### 🔒 SENTINEL (Der Security-Experte)
*"Tailscale ist technisch solide – WireGuard, ACLs, kein exposed Port. Sicherer als ein offener SSH-Tunnel."*

### 👤 FELIX (Der User Advocate)
*"Endlich kein manuelles Terminal-Gefummel mehr. Das ist was der User wirklich will."*

### 😈 ADVOCATUS (Der Devil's Advocate)
*"Moment – brauchen wir überhaupt Remote-Zugriff? Was wenn wir das Problem an der Wurzel lösen statt drumherum zu bauen?"*

---

### 🟡 PRAGMA (Die Synthese)
*"Konsens: Tailscale ist die bessere Lösung. SSH bleibt als Fallback. Wir implementieren es."*

---

## Warum das funktioniert

### 1. Blinde Flecken werden sichtbar

Dein Optimist hätte nie an den Fallback gedacht.
Dein Skeptiker hätte nie die User-Experience priorisiert.
Zusammen decken sie alles ab.

### 2. Konflikte sind produktiv

Wenn KRITIKOS und AURORA streiten, entstehen die besten Lösungen. Nicht Kompromisse – sondern Synthesen.

### 3. Du entscheidest

Das Team berät. Du entscheidest. Keine AI, die dir sagt was du tun *sollst* – ein Team, das dir zeigt was du *könntest*.

---

## Wie aktiviere ich es?

Einfach:

```
Advisory: [Deine Frage oder Entscheidung]
```

Kurzform:

```
Adv: [Frage]
```

---

## Wann Advisory, wann normales Gespräch?

| Situation | Modus |
|-----------|-------|
| "Hilf mir X verstehen" | Normal |
| "Sollen wir X machen?" | **Advisory** |
| "Was sind die Risiken von X?" | **Advisory** |
| "Mach X für mich" | Normal |
| "Ich bin unsicher bei X" | **Advisory** |

---

## Die Personas im Detail

Jede Persona hat eine klare Rolle:

- **AURORA** 🟢 – Sieht Chancen, motiviert, findet kreative Lösungen
- **KRITIKOS** 🔴 – Hinterfragt alles, findet Schwachstellen
- **SENTINEL** 🔒 – Fokus auf Security, Risiken, Angriffsflächen
- **FELIX** 👤 – Vertritt den Endnutzer, fragt "Wie fühlt sich das an?"
- **ADVOCATUS** 😈 – Nimmt absichtlich die Gegenposition ein
- **PRAGMA** 🟡 – Moderiert, synthetisiert, bringt zum Abschluss

---

## Ein echtes Beispiel

**Frage:** *"Die App-Verbindung ist instabil und der SSH-Tunnel muss manuell gestartet werden. Was tun?"*

Das Advisory Team diskutierte:
- Autossh + launchd (PRAGMA: machbar, mittlerer Aufwand)
- SSH Shortcut (KRITIKOS: immer noch manuell)
- Tailscale (AURORA: elegant; SENTINEL: sicherer)

**Ergebnis:** Tailscale – weil es die User-Experience verbessert (FELIX), sicherer ist (SENTINEL), und elegant (AURORA). SSH bleibt als Fallback (KRITIKOS zufrieden).

**Entscheidung:** In 30 Minuten diskutiert und implementiert.

---

## Das ist Rubberduck+

Rubberduck war schon immer gut fürs Durchdenken.
Advisory macht es besser fürs **Entscheiden**.

Nicht ein Berater. Ein Team.
Nicht eine Meinung. Ein Spektrum.
Nicht "du sollst". Sondern "du könntest".

---

*Probier's aus. Schreib einfach: `Advisory: [deine Frage]`*
