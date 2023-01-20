# Progetto-PDMIU-Web
# Progettazione e realizzazione di un sistema di ordinazione online
Relatore: Giacomo Di Fabrizio 322856 

Docente: Prof. Cuno Lorenz Klopfenstein

Gennaio 2023
## Idea e scopo dell'applicazione
Il progetto consiste nella realizzazione di un'applicazione web per l’ordinazione di pasti e bevande e di un'applicazione Android per la visualizzazione e l'eliminazione di queste ultime.

L'applicativo web dovrà consentire:
* La selezione delle pietanze desiderate.
* La rimozione di pietanze che precedentemente erano state selezionate.
* La selezione del tavolo in cui l'ordine è stato effettuato.
* La visualizzazione a schermo del prezzo totale che l’utente dovrà pagare.
* L' ordinazione delle pietanze selezionate. 


L'applicativo Android dovrà consentire:
* La visualizzazione delle ordinazioni effettuate.
* La rimozione delle ordinazioni effettuate.


Entrambe le applicazioni utilizzano Firebase. 

In particolare:
* l'applicazione web utilizza Firebase per l'hosting e per la memorizzazione delle ordinazioni su Firestore database.
* l'applicazione Android utilizza Firebase per la visualizzazione e l'eliminazione delle ordinazioni presenti sul Firestore database.
## Casi d'uso
UML dei casi d'uso per l'applicazione web.

![Assignament4 UML](https://user-images.githubusercontent.com/73546258/213475955-7d574101-f2b5-44a1-b124-5ea9cb1b506a.png)

UML dei casi d'uso per l'applicazione android.

![Assignament5 UML](https://user-images.githubusercontent.com/73546258/213476112-51bab689-3087-4398-b737-04e9a7d58a5d.png)

## Esperienza utente
### Applicazione web
Durante il primo avvio all'utente è mostrata la **pagina home**, componente principale dell'applicazione. Da quest'ultima è possibile effettuare le seguenti operazioni:
* Aprire la pagina per visualizzare ed ordinare le pizze.
* Aprire la pagina per visualizzare ed ordinare i panini.
* Aprire la pagina per visualizzare ed ordinare le bevande.
* Visualizzare il carrello.

![homepage](https://user-images.githubusercontent.com/73546258/213477251-98c44616-2ae6-4c63-91f2-bfa54e97566c.png)
Si è scelto di non inserire durante il primo avvio una schermata di login per velocizzare l'operazione di prenotazione in quanto l'applicazione è pensata come applicativo web da cui si accederà tramite QR code all'interno del ristorante.

Durante il processo di selezione verrà mostrata per ogni tipologia di cibo la seguente schermata:






https://user-images.githubusercontent.com/73546258/213669549-07ba01a7-f715-40a4-a228-0875b2842452.mp4








In queste schermate risulta possibile per l'utente:
* Selezionare le pietanze che desidera cliccando il bottone "Aggiungi all'ordine".
* Tornare all'homepage.
* Visualizzare il numero di pietanze già ordinate.
* Andare nella pagina del carrello. 

Da ogni pagina (che non sia il carrello stesso o la pagina che ci conferma l'effettiva ordinazione) è possibile accedere al carrello.

Il carrello permette di:
* Visualizzare l'elenco delle pietanze ordinate con relativo prezzo.
* L'eliminazione tramite scorrimento verso destra o sinistra.
* Selezionare il tavolo in cui il cliente è seduto.
* Visualizzare il prezzo totale dell'ordine. (Il prezzo si aggiorna automaticamente in caso di inserimento o rimozione di una pietanza).
* Confermare e inviare l'ordinazione.




https://user-images.githubusercontent.com/73546258/213668337-1da416d2-1819-4714-9649-778212354c06.mp4









Infine come ultima schermata (una volta effettuato e confermato l'ordine) abbiamo la seguente:

![ringraziamento](https://user-images.githubusercontent.com/73546258/213482756-61fba753-82f9-433e-bd93-88b67f2351bb.PNG)

### Applicazione android
L'applicazione Android risulta una semplice applicazione nella quale è possibile visualizzare gli ordini effettuati ed eliminarli una volta completati.


https://user-images.githubusercontent.com/73546258/213488210-fcc12ed3-ee73-4c0c-944b-f8d3d98813e9.mp4

## Tecnologia
Sia l'applicativo Web che l'applicativo Android utilizzano Firebase per scambiarsi l'uno con l'altro i dati.

Firebase è un insieme di servizi di hosting per qualsiasi tipo di applicazione (Android, iOS, Javascript, Node.js, Java, Unity, PHP, C...). Offre NoSQL e hosting in tempo reale di database, contenuti, autenticazione social (Google, Facebook, Twitter e Github) e notifiche o servizi, come un server di comunicazione in tempo reale.

In questo caso specifico è stato utilizzato per realizzare l'hosting dell'applicativo Web e per utilizzare un Firestore Database in modo tale da memorizzare e visualizzare a tempo reale le ordinazioni.

Lo stato delle applicazioni è stato gestito tramite i provider, in particolare sono stati utilizzati gli StateNotifierProvider.

Per quanto riguarda i dati sono state costruite diverse classi (Pizza, Panino, Bevanda) entrambe figlie della classe Cibo. La classe CiboList è stata scritta per implementare lo StateNotifierProvider. L'altra classe che implementa lo StateNotifierProvider è la classe OrderNotifier.

Le varie pietanze vengono memorizzate e caricate tramite diversi file json (uno per diversa tipologia di pietanze tra pizza, panino e bevanda), mentre gli ordini come è stato già detto precedentemente vengono memorizzati e letti nel Firestore Database.

L'interazione con il back-end in firebase è avvenuta seguendo la documentazione di firebase, dopo di che non si è trattato altro di utilizzare le semplici operazioni CRUD che il database ci mette a disposizione.

Come è possibile visualizzare dall'immagine seguente, le ordinazioni vengono memorizzate come documenti all'interno della raccolta "orders".

![database](https://user-images.githubusercontent.com/73546258/213489021-48ec0bfe-1151-4444-b5df-cd0534800106.png)


## Pacchetti Aggiuntivi
Nell'applicazione sono stati utilizzati diversi pacchetti aggiuntivi dichiarati come dependencies. Fra questi quelli più interessanti sono:
* flutter_riverpod: una libreria di gestione dello stato
* json_serializable: libreria che genera codice per convertire automaticamente una classe dart da/in JSON
* json_annotation: definisce le annotazioni utilizzate da json serializable per creare codice per la serializzazione e deserializzazione JSON.
* uuid: libreria che permette la generazione semplice e veloce di UUID RFC4122
* firebase_core: Un plug-in Flutter per utilizzare l'API Firebase Core, che consente la connessione a più app Firebase.
* cloud_firestore: Un plug-in Flutter per utilizzare l'API Cloud Firestore.
* badges: Un pacchetto flutter per la creazione di badge.
