# Windows 11 Font Backup Tool

Questo strumento consente di creare un backup completo di tutti i font installati sul tuo sistema Windows 11 e di reinstallarli facilmente dopo una formattazione o su un altro computer.

## 📋 Caratteristiche

- Esegue il backup sia dei font installati dall'utente che dei font di sistema
- Crea una lista organizzata di tutti i font con indicazione della provenienza
- Genera automaticamente uno script per reinstallare tutti i font con un solo clic
- Supporta tutti i formati di font comuni (.ttf, .otf, .ttc, .fon)
- Non richiede software aggiuntivi, usa solo comandi nativi di Windows

## 🚀 Come utilizzare lo strumento

### Creare il backup dei font

1. Scarica il file `BackupFonts.bat`
2. Posizionalo in una cartella dove desideri salvare il backup (es. una chiavetta USB o un disco esterno)
3. Esegui il file con un doppio clic
4. Attendi il completamento dell'operazione
5. Verrà creata una sottocartella `FontBackup` contenente:
   - Tutti i file dei font copiati
   - Un file `fonts_list.txt` con l'elenco dei font
   - Uno script `InstallFonts.bat` per la reinstallazione

### Reinstallare i font dopo una formattazione

1. Accedi al tuo sistema Windows 11 appena installato
2. Naviga nella cartella `FontBackup` creata dallo script
3. Esegui il file `InstallFonts.bat` con un doppio clic
4. Attendi il completamento dell'installazione
5. Tutti i font verranno installati automaticamente nel tuo profilo utente

## 🔍 Contenuto della cartella di backup

Dopo l'esecuzione dello script, nella cartella `FontBackup` troverai:

- **Tutti i file dei font** (.ttf, .otf, .ttc, .fon) copiati dal tuo sistema
- **fonts_list.txt**: un elenco di tutti i font con indicazione se provengono dalla cartella di sistema o dall'utente
- **InstallFonts.bat**: lo script per reinstallare automaticamente tutti i font

## ⚠️ Note importanti

- Lo script deve essere eseguito con i privilegi di amministratore per accedere ad alcuni font di sistema
- I font installati verranno configurati nel registro dell'utente corrente
- Il processo di backup potrebbe richiedere alcuni minuti se hai molti font installati
- Durante l'installazione, alcune finestre di dialogo potrebbero apparire momentaneamente

## 🛠️ Risoluzione dei problemi

- **Problema**: Lo script si chiude immediatamente
  **Soluzione**: Eseguilo da prompt dei comandi per vedere eventuali errori

- **Problema**: Alcuni font non vengono copiati
  **Soluzione**: Assicurati di eseguire lo script come amministratore

- **Problema**: Lo script di installazione non funziona
  **Soluzione**: Verifica di avere i permessi di scrittura nella cartella dei font

## 📝 Limitazioni

- Lo script non può ripristinare le associazioni dei font con applicazioni specifiche
- I font incorporati nel sistema e protetti potrebbero non essere copiati correttamente
- I font attivi al momento del backup potrebbero richiedere un riavvio per essere reinstallati

## 📄 Licenza

Questo script è fornito "così com'è", senza garanzie. Sei libero di modificarlo e distribuirlo secondo le tue necessità.

---

Creato per semplificare il backup e il ripristino dei font in Windows 11.
