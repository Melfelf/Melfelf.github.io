+++
title = "M-Note 0.23.1: Live-Gespräche mit klaren Grenzen"
date = 2026-10-01T17:31:00+02:00
slug = "m-note-0-23-1-live-gespraeche"
description = "Der zuletzt bestätigte M-Note-Build verbessert den Start von Live-Gesprächen und macht parallele Nutzung berechenbarer. Upload bestätigt, TestFlight-Verfügbarkeit noch offen."
draft = false

[taxonomies]
tags = ["M-Note", "iOS", "App-Entwicklung", "AI", "Sprachnotizen"]

[extra]
lang = "de"
+++

Eine Sprachaufnahme ist erst dann nützlich, wenn aus ihr eine Notiz wird, die sich prüfen und weiterverwenden lässt. Bei M-Note geht es deshalb nicht nur um Transkription, sondern auch darum, dass ein Gespräch verlässlich startet und sein Zustand verständlich bleibt.

Der zuletzt bestätigte Build ist Version 0.23.1 (53). Er wurde am 22. September 2026 erfolgreich zu App Store Connect hochgeladen. Apple bestätigte, dass das Paket verarbeitet wird. Ob der Build in TestFlight verfügbar ist und welchen Gruppen er zugewiesen wurde, ist noch nicht bestätigt. M-Note ist weiterhin nicht öffentlich im App Store erhältlich.

## Ein Gespräch muss sauber starten

Der neue Build verbessert den Start von Live-Gesprächen. Schlägt ein leerer Start fehl, lässt er sich direkt wiederholen. Thema und gewählte Persona bleiben erhalten, auch wenn die App neu gestartet wird. So muss man nicht erst den ganzen Ablauf zurücksetzen, nur weil die erste Verbindung nicht geklappt hat.

## Gleichzeitige Nutzung braucht eine Grenze

Live-Audio beansprucht gemeinsam genutzte Ressourcen. Build 53 reserviert Gesprächsplätze dauerhaft und atomar. Pro Person läuft höchstens ein Gespräch gleichzeitig, insgesamt sind es höchstens vier. Ein Platz wird nach einem normalen Ende oder einem Startfehler freigegeben. Bei einem abgerissenen Gespräch läuft die Reservierung spätestens nach 16 Minuten aus.

Das ist eine Kapazitätsgrenze, keine finanzielle Obergrenze. Sie macht gleichzeitige Nutzung besser kontrollierbar, ersetzt aber weder ein Ausgabenlimit noch ein späteres Kaufkontingent.

## Upload ist noch keine Veröffentlichung

Ein erfolgreicher Upload sagt, dass ein Build bei Apple angekommen ist. Er sagt nicht, dass Testerinnen und Tester ihn bereits sehen können. Dafür müssen Verarbeitung, TestFlight-Verfügbarkeit und Gruppenzuweisung bestätigt sein. Auch eine öffentliche App-Store-Freigabe ist ein eigener Schritt.

Ich halte den Status deshalb bewusst präzise: Build 53 ist hochgeladen, die TestFlight-Verfügbarkeit ist noch offen. Sobald sich das bestätigt, lässt sich die nächste Änderung sauber einordnen.

[M-Note und der bestätigte Entwicklungsstand](/m-note/) · [Alle Apps von Melfware](/apps/)
