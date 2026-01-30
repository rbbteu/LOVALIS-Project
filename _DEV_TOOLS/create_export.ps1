# --- LOVALIS FULL EXPORT FACTORY (v3.7.5) ---
$ErrorActionPreference = 'Stop'
$basePath = 'C:\LOVALIS-Kompendium'
$exportDir = "$basePath\08_FINAL_COMPENDIUM_EXPORTS"
if (-not (Test-Path $exportDir)) { New-Item -ItemType Directory -Force -Path $exportDir | Out-Null }
$tick = [char]96 + [char]96 + [char]96 

Write-Host 'Starte Groß-Export des Kompendiums...' -ForegroundColor Cyan

# ==============================================================================
# 1. DAS HANDBUCH (Das komplette Werk als eine Datei)
# ==============================================================================
$bookPath = "$exportDir\LOVALIS_MASTER_HANDBUCH_V3_7_4.md"
$bookLines = @(
    '% LOVALIS: DAS VOLLSTÄNDIGE KOMPENDIUM',
    '% Version 3.7.4 (Gold Master)',
    '% Autor: Mensch-Maschine-Kollaboration (2026)',
    '',
    '# EINLEITUNG',
    'Dieses Dokument enthält die Gesamtheit der LOVALIS-Spezifikationen. Es dient als rechtsverbindliche Basis für die Gründung und den Betrieb von Clustern.'
)

$folders = @('01_Buch_I_Kernel', '02_Buch_II_Puls_OS', '03_Buch_III_Justice_Rehab', '04_Buch_IV_Simulation', '05_Buch_V_Vernetzung', '06_Buch_VI_Transition', '07_Buch_VII_Toolbox')

foreach ($f in $folders) {
    if (Test-Path "$basePath\$f") {
        $bookLines += ("`n# KAPITEL: " + $f.ToUpper().Replace('_', ' '))
        $files = Get-ChildItem -Path "$basePath\$f" -Recurse -Include "*.md" | Sort-Object Name
        foreach ($file in $files) {
            $bookLines += ("`n## MODUL: " + $file.BaseName.Replace('_', ' '))
            $bookLines += Get-Content $file.FullName
            $bookLines += '---'
        }
    }
}
[System.IO.File]::WriteAllLines($bookPath, $bookLines, [System.Text.Encoding]::UTF8)
Write-Host '[-] Handbuch (PDF-Basis) generiert.' -ForegroundColor Yellow

# ==============================================================================
# 2. DIE PRÄSENTATION (25+ Folien Deep Dive)
# ==============================================================================
$slidePath = "$exportDir\LOVALIS_TECHNICAL_PRESENTATION.md"
$slideLines = @(
    '---', 'marp: true', 'theme: gaia', 'class: invert', 'paginate: true', '---',
    '# LOVALIS 3.7.4', '## Technical Deep Dive Briefing', '---',
    '# Folie 1: Das Axiom', '* Primat der Leidminimierung', '* T.Ö.E. Validierungspflicht', '---',
    '# Folie 2: Der Kernel', '* Die 13 Instanzen', '* Die 12 Anker-Rollen', '---',
    '# Folie 3: Puls-OS (Layer 0)', '* Physikalische Deckung durch Energie', '* 1 Puls = 1 kWh Referenz', '---',
    '# Folie 4: Puls-OS (Layer 1)', '* Anti-Inflations-Mechanik', '* Demurrage (Umlaufgebühr)', '---',
    '# Folie 5: Justice & Rehab', '* Abschaffung von Strafe', '* Rehabilitation durch T.Ö.E.-Module', '---',
    '# Folie 6: Der Codex (Herz)', '* Paragraphen 1-9: Soziale Integrität', '---',
    '# Folie 7: Der Codex (Hand)', '* Paragraphen 10-18: Physische Welt', '---',
    '# Folie 8: Der Codex (Kopf)', '* Paragraphen 19-27: Verwaltung & Ethik', '---',
    '# Folie 9: Simulation & Pädagogik', '* Lernen durch Ineffizienz', '* Das Ende der Leistungs-Angst', '---',
    '# Folie 10: Cluster-Topologie', '* Die Dunbars-Zahl (150 Personen)', '* Mesh-Vernetzung', '---',
    '# Folie 11: Föderations-Logik', '* Souveränität vs. Skalierung', '---',
    '# Folie 12: Transition Phase 1', '* Der Submarine-Modus', '* Rechtliche Tarnung', '---',
    '# Folie 13: Transition Phase 2', '* Autarkie-Ringe', '* Energie-Souveränität', '---',
    '# Folie 14: Transition Phase 3', '* Kognitive Infiltration', '---',
    '# Folie 15: Tool: V-Gate', '* Die psychologische Firewall', '---',
    '# Folie 16: Tool: Glass House', '* Totale Transparenz der Macht', '---',
    '# Folie 17: Tool: Liquid Feedback', '* Synarchische Entscheidungsfindung', '---',
    '# Folie 18: Tool: Spherical Comp', '* Vektorielle Wertbemessung', '---',
    '# Folie 19: Tool: Resonance Ledger', '* Vertrauen als Währung', '---',
    '# Folie 20: Tool: Blind Hiring', '* Objektive Talent-Allokation', '---',
    '# Folie 21: Hardware: Node One', '* Dual-Vault Architektur', '* Open Source RISC-V', '---',
    '# Folie 22: Hardware: Node Zero', '* Inklusions-Spezifikation', '---',
    '# Folie 23: Krisen-Management', '* Der Not-Aus-Algorithmus', '---',
    '# Folie 24: Die 13. Instanz', '* System-Kritik als Pflicht', '---',
    '# Folie 25: Roadmap 2026+', '* Erste Cluster-Gründung', '* Prototyping Node One'
)
[System.IO.File]::WriteAllLines($slidePath, $slideLines, [System.Text.Encoding]::UTF8)
Write-Host '[-] Präsentation (25 Slides) generiert.' -ForegroundColor Yellow

# ==============================================================================
# 3. DAS EBOOK (Narrative Dokumentation - "Der Zyklus")
# ==============================================================================
$ebookPath = "$exportDir\LOVALIS_THE_CYCLE_EBOOK.md"
$ebookLines = @(
    '# DER ZYKLUS: EIN MONAT IN LOVALIS',
    '## Narrative System-Dokumentation',
    '',
    '### Woche 1: Die Ankunft',
    'In diesem Kapitel wird das Onboarding-Protokoll und das V-Gate Setting beschrieben...',
    '',
    '### Woche 2: Der Puls-Check',
    'Eine detaillierte Beschreibung der ökonomischen Interaktionen im Cluster...',
    '',
    '### Woche 3: Das Tribunal',
    'Wie der Justice-Rehab-Prozess in einem realen Konfliktfall greift...',
    '',
    '### Woche 4: Die Synarchie',
    'Der Prozess der großen Cluster-Entscheidung via Liquid Feedback...'
)
[System.IO.File]::WriteAllLines($ebookPath, $ebookLines, [System.Text.Encoding]::UTF8)
Write-Host '[-] eBook-Struktur generiert.' -ForegroundColor Yellow

Write-Host "`n✅ VOLLSTÄNDIGER KOMPENDIUM-EXPORT ABGESCHLOSSEN." -ForegroundColor Green
Invoke-Item $exportDir