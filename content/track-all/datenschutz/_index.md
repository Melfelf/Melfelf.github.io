+++
title = "Datenschutz bei Track All"
description = "Wie Track All App-Daten, optionale Verbindungen und bewusst ausgewählte Fotos verarbeitet."
template = "prose.html"
[extra]
lang = "de"
+++

Stand 22. November 2026. Verantwortlich für Track All ist Stefan Moser. Bei Datenschutzfragen und Anfragen zu Auskunft, Berichtigung oder Löschung erreichst du ihn unter [stefan@melf.ch](mailto:stefan@melf.ch?subject=Track%20All%20Datenschutz).

## Tagebuch und Berichte

Track All speichert Mahlzeiten, Getränke, Ziele, Alltagseinträge und Auswertungen standardmässig auf deinem Gerät. Das Tagebuch braucht kein Anbieterkonto. Die App enthält keine Werbung oder Analyse-SDKs. Stefan Moser verkauft keine Daten und verwendet sie nicht für personenbezogenes Tracking.

Mitteilungen werden auf deinem Gerät geplant. Wenn du eine Sicherung oder einen Bericht exportierst, wählst du den Speicherort oder Empfänger. Deine Sicherung kann persönliche und gesundheitsbezogene Einträge enthalten. Lokale Essensfotos sind von der JSON-Sicherung ausgenommen.

## Apple Health und iCloud

Track All liest nur die Apple-Health-Kategorien, die du erlaubst. Je nach Auswahl sind das Gewicht, Schritte, Schlaf und Trainings. Importkopien werden auf dem Gerät gespeichert und lassen sich in Track All entfernen. Die App schreibt keine Daten in Apple Health.

Wenn du den angebotenen iCloud-Abgleich ausdrücklich aktivierst, speichert Apple Mahlzeiten, Wasser, manuell erfasstes Gewicht, Favoriten, Entscheidungen, manuelle Alltagseinträge, Notizen und Hypothesen in deinem privaten iCloud-Bereich. Ernährungsziele werden über Apples iCloud-Schlüsselwertspeicher abgeglichen. Deinen privaten iCloud-Inhalt kann Stefan Moser nicht einsehen. Das Ausschalten beendet den Abgleich nach einem vollständigen Neustart. Es löscht bereits in iCloud gespeicherte Daten nicht. Apple-Health-Importkopien sind vom iCloud-Abgleich ausgeschlossen.

## Produkt- und Wetterabfragen

Für eine von dir ausgelöste Produktsuche erhält Open Food Facts den Suchbegriff oder Barcode sowie die technisch erforderlichen Verbindungsdaten und eine feste App-Kennung. Track All sendet dabei keine Tagebucheinträge. [Datenschutz von Open Food Facts](https://world.openfoodfacts.org/privacy)

Für freiwillige Wetterabfragen werden Koordinaten vor der Übertragung an Open-Meteo auf zwei Dezimalstellen gerundet. Open-Meteo gibt an, abgefragte Koordinaten und IP-Adressen für bis zu 90 Tage protokollieren zu können. Im Eintrag speichert Track All keine Koordinaten. [Bedingungen und Datenschutz von Open-Meteo](https://open-meteo.com/en/terms)

## Freiwillige Foto-Schätzung

Wenn du die Foto-Schätzung nutzt, erhält der über Cloudflare betriebene Dienst zunächst einen Apple-Identitätstoken für die Anmeldung. Die App fragt keine E-Mail- oder Namensfreigabe an. Der Dienst speichert eine gehashte Apple-Kennung in der Sitzung für bis zu 30 Tage. Ein kurzlebiger Zähler begrenzt Abfragen. Beim Abmelden entfernt die App das Sitzungstoken vom Gerät und fordert den Dienst auf, die Sitzung zu löschen.

Erst nach deiner Einwilligung und dem Start der Schätzung werden das ausgewählte, verkleinerte JPEG ohne EXIF- und GPS-Daten sowie dein freiwilliger Zusatztext über den Cloudflare-Dienst an OpenAI geschickt. Der Dienst speichert keine Fotos. OpenAI erhält keine Apple-Kennung, keine anderen Mahlzeiten und keine Apple-Health-Importe. Die Speicherung der API-Antwort ist deaktiviert. OpenAI kann Inhalte in Protokollen zur Missbrauchsüberwachung grundsätzlich bis zu 30 Tage vorhalten. [Cloudflare](https://www.cloudflare.com/privacypolicy/) · [Datenverarbeitung bei OpenAI](https://developers.openai.com/api/docs/guides/your-data)

Gespeicherte Essensfotos bleiben auf deinem Gerät, ausserhalb der JSON-Sicherung und des iCloud-Abgleichs. Wenn du den zugehörigen Eintrag löschst, entfernt Track All das lokale Foto.

## Sprache, Kurzbefehle und lokale Textvorschläge

Die Mikrofontaste in Track All transkribiert Sprache auf dem Gerät. Track All speichert kein Roh-Audio. Bei Siri oder Kurzbefehlen verarbeitet zunächst Apples System die Eingabe. Lokale Textvorschläge für bewusst ausgewählte Notizen verwenden auf unterstützten Geräten Apples Modell auf dem Gerät. Freigegebene Apple-Health-Daten werden für diese Funktionen nicht an ein Sprachmodell gesendet.

[Support für Track All](/track-all/support/)
