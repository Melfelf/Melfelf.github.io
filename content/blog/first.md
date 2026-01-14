+++
title = "Korrelation und Kausalität - Ein wichtiger Unterschied"
date = 2025-06-04T09:15:00+02:00
updated = 2025-06-04T09:15:00+02:00
+++

## Der Unterschied zwischen Korrelation und Kausalität

Heute möchte ich über einen häufigen Denkfehler sprechen: Die Verwechslung von Korrelation und Kausalität. Dieser Fehler begegnet mir immer wieder, sowohl in der IT als auch im Alltag.

### Was bedeutet das eigentlich?

- **Korrelation** bedeutet, dass zwei Ereignisse häufig zusammen auftreten.
- **Kausalität** hingegen bedeutet, dass ein Ereignis tatsächlich die Ursache für ein anderes ist.

### Ein einfaches Beispiel

An heißen Sommertagen werden mehr Eis und auch mehr Getränke verkauft. Hier besteht eine Korrelation - beide Verkaufszahlen steigen gemeinsam an. Das bedeutet aber nicht, dass der Eisverkauf den Getränkeverkauf verursacht oder umgekehrt. Stattdessen gibt es einen dritten Faktor - das warme Wetter - der beide beeinflusst.

Weitere typische Stolperfallen:
- **IT-Monitoring**: CPU-Last und Fehlermeldungen steigen gleichzeitig, aber die eigentliche Ursache ist eine fehlerhafte Deployment-Routine.
- **Security**: Mehr Logins und mehr Fehlversuche treten zeitgleich auf, doch ausgelöst durch eine Marketingkampagne, die neue Nutzer anlockt.
- **Projektalltag**: Schlechte Stimmung im Team und langsamer Fortschritt scheinen zusammenzuhängen, tatsächlich fehlt eine klare Priorisierung.

### Warum ist diese Unterscheidung wichtig?

In der IT-Welt, besonders bei der Analyse von Systemproblemen oder der Interpretation von Monitoring-Daten, ist es entscheidend, nicht vorschnell von Korrelationen auf Ursachen zu schließen. Nur weil zwei Ereignisse zeitlich zusammenfallen, muss nicht automatisch eines die Ursache des anderen sein.

So gehe ich vor, um Korrelation nicht mit Kausalität zu verwechseln:

1. **Hypothesen notieren**: Welche Ursachen sind plausibel? Welche davon sind nur Begleiterscheinungen?
2. **Datenquellen prüfen**: Gibt es Logs, Metriken oder Events, die einen zeitlichen Vorlauf zeigen?
3. **Gegenprobe**: Tritt das Muster auch auf, wenn ein vermuteter Auslöser fehlt?
4. **Dritte Variablen suchen**: Welche gemeinsame Ursache könnte beide Effekte erklären?
5. **Iterativ testen**: Kleine Experimente oder Konfigurationsänderungen helfen, Annahmen zu prüfen.

### Fazit

Die Erkenntnis "Korrelation impliziert keine Kausalität" ist ein wichtiges Werkzeug für kritisches Denken - nicht nur in der IT, sondern in allen Bereichen des Lebens. Wer Ursache und Wirkung sauber trennt, löst Probleme schneller, trifft bessere Entscheidungen und lässt sich weniger von scheinbar offensichtlichen Zusammenhängen täuschen.

Test
