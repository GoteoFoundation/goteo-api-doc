---
layout: default
title: Projects
group: endpoint
permalink: /doc/projects/
---
# Projects endpoint

This section gives you information about projects in [Goteo.org](http://goteo.org)

<a name="projects"></a>
## /projects/

Obtains a list of projects.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/projects/
```

### Filters available:
**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

* **from_date** and **to_date** restricts the list to the projects created in that range

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array (limited to the maximum results per page specified in filters) with the list of projects |
| **meta** | *array* | Additionally, extra information will be provided here (such as pagination or parameter filtering ) |

#### * Array sub-fields:

**items** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the project in Goteo |
| **name** | *string* | Name of the project |
| **node** | *string* | Node where the project was created originally |
| **owner** | *string* | Project's creator username |
| **project-url** | *string* | Project's original URL crowdfunding webpage |
| **image-url** | *string* | Project's main URL image |
| **latitude** | *number (float)* | Project's location: latitude in decimal degrees |
| **longitude** | *number (float)* | Project's location: longitude in decimal degrees |
| **date-created** | *datetime* | Date when the project was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |
| **date-published** | *datetime* | Date when the project was accepted and publicly available [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |


### Response body:
```json
{
  "items": [
    {
      "date-created": "Mon, 25 Feb 2013 23:00:00 GMT",
      "date-published": "Wed, 06 Mar 2013 23:00:00 GMT",
      "id": "10-anys-de-l-antic-teatre",
      "image-url": "https://goteo.org/img/medium/2on-banner-goteo_2r.jpg",
      "latitude": 41.38506390000000,
      "longitude": 2.17340350000000,
      "name": "2003-2013: 10 anys de l'Antic Teatre",
      "node": "goteo",
      "owner": "anticteatre3",
      "project-url": "https://goteo.org/project/10-anys-de-l-antic-teatre",
      "status": "funded"
    },
    {
      "date-created": "Tue, 20 Mar 2012 23:00:00 GMT",
      "date-published": "Tue, 09 Apr 2013 22:00:00 GMT",
      "id": "10-festival-de-radio-almenara",
      "image-url": "https://goteo.org/img/medium/festi5r.jpg",
      "latitude": 40.41677540000000,
      "longitude": -3.70379020000000,
      "name": "10\u00ba Festival de Radio Almenara",
      "node": "goteo",
      "owner": "almenararadio",
      "project-url": "https://goteo.org/project/10-festival-de-radio-almenara",
      "status": "funded"
    },
    {
      "date-created": "Mon, 12 Nov 2012 23:00:00 GMT",
      "date-published": "Fri, 30 Nov 2012 23:00:00 GMT",
      "id": "160metros",
      "image-url": "https://goteo.org/img/medium/titulo160metros.jpg",
      "latitude": 43.26301260000000,
      "longitude": -2.93498520000000,
      "name": "160 metros: una historia del rock en Bizkaia",
      "node": "euskadi",
      "owner": "mediatag",
      "project-url": "https://goteo.org/project/160metros",
      "status": "fulfilled"
    },
    {
      "date-created": "Mon, 09 Jul 2012 22:00:00 GMT",
      "date-published": "Sun, 02 Sep 2012 22:00:00 GMT",
      "id": "1a-fira-d-economia-solidaria-de-catalunya",
      "image-url": "https://goteo.org/img/medium/ppal_1.png",
      "latitude": 41.38506390000000,
      "longitude": 2.17340350000000,
      "name": "1\u00aa Fira d'Economia Solid\u00e0ria de Catalunya",
      "node": "goteo",
      "owner": "xes",
      "project-url": "https://goteo.org/project/1a-fira-d-economia-solidaria-de-catalunya",
      "status": "fulfilled"
    },
    {
      "date-created": "Tue, 16 Apr 2013 22:00:00 GMT",
      "date-published": "Mon, 27 May 2013 22:00:00 GMT",
      "id": "2a-edicio-in-situ",
      "image-url": "https://goteo.org/img/medium/005insitur.jpg",
      "latitude": 41.38506390000000,
      "longitude": 2.17340350000000,
      "name": "2\u00aa Edici\u00f3 IN SITU Mostra de dansa contempor\u00e0nia",
      "node": "barcelona",
      "owner": "mostrainsitu",
      "project-url": "https://goteo.org/project/2a-edicio-in-situ",
      "status": "funded"
    },
    {
      "date-created": "Thu, 19 Jul 2012 22:00:00 GMT",
      "date-published": "Sun, 09 Sep 2012 22:00:00 GMT",
      "id": "70-anos-de-conflicto",
      "image-url": "https://goteo.org/img/medium/muro-lamentaciones-2.jpg",
      "latitude": 40.66264810000000,
      "longitude": -3.77104570000000,
      "name": "70 a\u00f1os de conflicto",
      "node": "goteo",
      "owner": "espallargas",
      "project-url": "https://goteo.org/project/70-anos-de-conflicto",
      "status": "unfunded"
    },
    {
      "date-created": "Tue, 20 Aug 2013 22:00:00 GMT",
      "date-published": "Thu, 12 Sep 2013 22:00:00 GMT",
      "id": "80kilosenbici",
      "image-url": "https://goteo.org/img/medium/iz_3.jpg",
      "latitude": 43.26301260000000,
      "longitude": -2.93498520000000,
      "name": "80 kilos en bici",
      "node": "euskadi",
      "owner": "izkiri",
      "project-url": "https://goteo.org/project/80kilosenbici",
      "status": "funded"
    },
    {
      "date-created": "Sun, 29 Jul 2012 22:00:00 GMT",
      "date-published": "Sun, 23 Sep 2012 22:00:00 GMT",
      "id": "a-cero",
      "image-url": "https://goteo.org/img/medium/resi.jpg",
      "latitude": 43.60465200000000,
      "longitude": 1.44420900000000,
      "name": "A CERO",
      "node": "barcelona",
      "owner": "mina-trapp",
      "project-url": "https://goteo.org/project/a-cero",
      "status": "fulfilled"
    },
    {
      "date-created": "Mon, 15 Dec 2014 23:00:00 GMT",
      "date-published": "Sun, 01 Feb 2015 23:00:00 GMT",
      "id": "a-contracorriente",
      "image-url": "https://goteo.org/img/medium/cartel-a-contracorriente.jpg",
      "latitude": 38.26677300000000,
      "longitude": -5.41882830000000,
      "name": "A contracorriente",
      "node": "andalucia",
      "owner": "brumaria",
      "project-url": "https://goteo.org/project/a-contracorriente",
      "status": "funded"
    },
    {
      "date-created": "Tue, 01 May 2012 22:00:00 GMT",
      "date-published": "Tue, 22 May 2012 22:00:00 GMT",
      "id": "accesibilidad-en-ciudades",
      "image-url": "https://goteo.org/img/medium/punto-inaccesible-sobre-el-mapa.png",
      "latitude": 39.47527650000000,
      "longitude": -6.37242470000000,
      "name": "Abilidade: accesibilidad en ciudades",
      "node": "goteo",
      "owner": "jmunozco",
      "project-url": "https://goteo.org/project/accesibilidad-en-ciudades",
      "status": "unfunded"
    }
  ],
  "meta": {
    "limit": 10,
    "page": 0,
    "total": 571
  }
}
```

<a name="project"></a>
## /projects/{PROJECT_ID}

Gets information about a single project.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/projects/llevamealhuerto/
```

### Filters available:
* TODO: some filters will be available (such as langs filtering)
* **{PROJECT_ID}** must be the unique identifier of the project


### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the project in Goteo |
| **name** | *string* | Name of the project |
| **node** | *string* | Node where the project was created originally |
| **date-created** | *datetime* | Date when the project was created [RFC822 format](http://validator.w3.org/feed/docs/error/InvalidRFC2822Date.html) |
| **TODO** | --to be completed-- | Field's list are still work in progress, check the example below meanwhile |

### Response body:
```json
{
  "about": "llevamealhuerto.com se caracteriza por transmitir conocimientos de agricultura ecol\u00f3gica y sostenible, a trav\u00e9s de breves p\u00edldoras audiovisuales, de manera sencilla, cercana, f\u00e1cil y con buen humor. \r\n\r\nNos preocupamos de la calidad, tanto a nivel de contenidos como t\u00e9cnica, para conseguir llegar a la gente y resultarles de utilidad. Nuestro reto es convertirnos en un referente dentro del mundo de las huertas urbanas y alternativas, un espacio verde digital que se retroalimente de comentarios, experiencias de los/as propios/as hortelanos/as y otras noticias de inter\u00e9s.",
  "amount": 5210.0,
  "costs": [
    {
      "amount": 2800.0,
      "cost": "Equipo audiovisual ",
      "description": "Los videos son la esencia de este proyecto y creemos que por el hecho de emitirse en Internet  no hay que escatimar en calidad t\u00e9cnica, por ello nos hemos propuesto mejorar el equipo de grabaci\u00f3n con una c\u00e1mara profesional, un micro decente y tal vez alg\u00fan foco. ",
      "from-date": "Wed, 12 Sep 2012 22:00:00 GMT",
      "required": "True",
      "to-date": "Wed, 12 Sep 2012 22:00:00 GMT",
      "type": "material"
    },
    {
      "amount": 2200.0,
      "cost": "Equipo de edici\u00f3n",
      "description": "Necesitamos un ordenador con un procesador m\u00e1s potente para manejar im\u00e1genes HD a la hora de editar.",
      "from-date": "Sun, 18 Nov 2012 23:00:00 GMT",
      "required": "False",
      "to-date": "Sun, 13 Jan 2013 23:00:00 GMT",
      "type": "material"
    },
    {
      "amount": 1000.0,
      "cost": "Dise\u00f1o y programaci\u00f3n profesional de la web",
      "description": "Queremos convertir nuestra web en un medio realmente eficiente e interactivo con nuestro p\u00fablico, creemos que necesita mejorar el dise\u00f1o para convertirla en una plataforma m\u00e1s atractiva, sencilla y que invite a intervenir y profesionalizar la programaci\u00f3n para lograr un mejor posicionamiento.",
      "from-date": "Sun, 18 Nov 2012 23:00:00 GMT",
      "required": "True",
      "to-date": "Wed, 19 Dec 2012 23:00:00 GMT",
      "type": "task"
    },
    {
      "amount": 1400.0,
      "cost": "Programa piloto nueva secci\u00f3n \"Huertalizaci\u00f3n\"",
      "description": "\"Huertalizaci\u00f3n\" se trata de una nueva secci\u00f3n para mostrar, compartir y expandir las iniciativas de huertas urbanas, azoteas verdes, proyectos formativos en ciudades de todo el mundo. En el piloto queremos conocer las iniciativas de tres ciudades: Sevilla, Barcelona y Madrid a trav\u00e9s de una serie de reportajes que muestren sus experiencias en huertas urbanas y huertos compartidos, balcones comestibles y acciones sociales y formativas en torno al cultivo de la tierra.",
      "from-date": "Sun, 10 Mar 2013 23:00:00 GMT",
      "required": "True",
      "to-date": "Sun, 09 Jun 2013 22:00:00 GMT",
      "type": "task"
    },
    {
      "amount": 1800.0,
      "cost": "Dos pilotos m\u00e1s para la secci\u00f3n \"huertalizaci\u00f3n\"",
      "description": "Nos gustar\u00eda cubrir con nuestros reportajes algunas de las iniciativas que se est\u00e1n desarrollando en otros lugares de Europa en torno a las huertas urbanas, las azoteas verdes y los m\u00e9todos para cultivar en casa. Estamos pensando en Berlin, Londres y Par\u00eds que cuentan con iniciativas \"copiables\" en nuestras ciudades. ",
      "from-date": "Sun, 19 May 2013 22:00:00 GMT",
      "required": "False",
      "to-date": "Sun, 13 Oct 2013 22:00:00 GMT",
      "type": "task"
    }
  ],
  "currency": "EUR",
  "currency-rate": 1.00000,
  "date-closed": null,
  "date-created": "Tue, 10 Jul 2012 22:00:00 GMT",
  "date-passed": "Mon, 29 Oct 2012 23:00:00 GMT",
  "date-published": "Wed, 19 Sep 2012 22:00:00 GMT",
  "date-succeeded": "Sat, 08 Dec 2012 23:00:00 GMT",
  "date-updated": null,
  "description": "Un programa audiovisual on-line para aprender a cultivar en tu balc\u00f3n o en el huerto. Vivas d\u00f3nde vivas, en el campo, en la ciudad o en un pueblo, tanto si dispones de tierra propia, colectiva o solo de unas macetas, llevamealhuerto.com intenta transmitirte ese amor a la tierra, a comer rico, a implicarnos en el proceso de generar nuestra comida, eso s\u00ed \u00a1pas\u00e1ndonoslo bien!\r\n\r\nCada v\u00eddeo es una peque\u00f1a p\u00edldora pr\u00e1ctica, de la mano de I\u00f1aki Melgosa, un joven agricultor de Mung\u00eda, que nos cuenta sus trucos y consejos. Adem\u00e1s de esta secci\u00f3n llamada 'Balc\u00f3n comestible' el programa tiene otras dos: 'A pie de mata', donde recogemos iniciativas y proyectos alternativos relacionados con el primer sector y 'Baserritarrak', que pone en valor la sabidur\u00eda de nuestros mayores sobre la tierra y sus productos. \r\n\r\nLa difusi\u00f3n del programa es a trav\u00e9s de Internet, desde nuestra web y a trav\u00e9s de distintas redes sociales, lo que nos permite estar en contacto con todo un movimiento global de huertalizaci\u00f3n del mundo y de nuestras vidas.",
  "description-short": "Programa audiovisual on-line para aprender a cultivar en el balc\u00f3n y/o huerto",
  "goal": "Comenzamos a emitir llevamealhuerto.com hace s\u00f3lo unos meses -el pasado 14 de abril-, y ya llevamos producidos m\u00e1s de 60 v\u00eddeos. \r\n\r\nVemos que a la gente le interesa la iniciativa y por eso queremos dar un peque\u00f1o paso adelante: \r\n- Adquirir un equipo de producci\u00f3n audiovisual que nos permita poder trabajar con m\u00e1s autonom\u00eda. \r\n- Mejorar la arquitectura de la web.\r\n- Evolucionar toda la parte gr\u00e1fica.\r\n- Subtitular v\u00eddeos en otros idiomas.\r\n- Mejorar la comunicaci\u00f3n on-line y el posicionamiento.\r\n- As\u00ed como otras peque\u00f1as acciones que ayuden a mejorar la calidad del programa, el dinamismo, usabilidad e interactividad de la web, para as\u00ed llegar a m\u00e1s personas.\r\n\r\nAdem\u00e1s, queremos empezar una nueva secci\u00f3n: 'Huertalizaci\u00f3n' que sirva para divulgar experiencias de agricultura ecol\u00f3gica alternativa y proyectos sostenibles relacionados con la tierra y los espacios urbanos de todo el mundo.",
  "id": "llevamealhuerto",
  "image-gallery": [
    {
      "image-url": "https://goteo.org/img/big/img-2931.jpg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/img-2936.jpg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/img-3081.jpg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/inaki-y-senora.jpeg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/20120315-img-0143.jpg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/20120315-img-0150.jpg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/20120403-img-0331.jpg",
      "resource-url": null
    },
    {
      "image-url": "https://goteo.org/img/big/20120403-img-0338.jpg",
      "resource-url": null
    }
  ],
  "image-url": "https://goteo.org/img/medium/inaki-y-senora.jpeg",
  "image-url-big": "https://goteo.org/img/big/inaki-y-senora.jpeg",
  "lang": "es",
  "location": null,
  "minimum": 5200.0,
  "motivation": "llevamealhuerto.com va dirigido a gente que quiera huertalizar su vida, gente joven o madura que se sienta atra\u00eda por la posibilidad de cultivar, ya sea en el balc\u00f3n o la terraza, participando en alguna iniciativa de huerto urbano en su barrio o sacando partido a ese peque\u00f1a parcela que ahora est\u00e1 llena de 'maleza' al lado de casa.  Por supuesto, es una iniciativa para los/as defensores/as de la soberan\u00eda alimenticia y los amantes de los sabores tradicionales. En definitiva, un proyecto dirigido a todas aquellas personas que hayan entendido la importancia de transformar lo cercano y cotidiano para cambiar algo tan grande como el mundo moderno. ",
  "name": "llevamealhuerto.com",
  "needs": [
    {
      "description": "Nos gustar\u00eda subtitular nuestros v\u00eddeos al euskera, al ingl\u00e9s y a otros idiomas, porque cuantos m\u00e1s seamos mejor.",
      "support": "Subt\u00edtulos",
      "type": "task"
    },
    {
      "description": "Nos vendr\u00eda muy bien conocer aplicaciones, buenos h\u00e1bitos y estrategias para sacarle m\u00e1s rendimiento a las redes sociales y nuestra Web.",
      "support": "Nociones avanzadas en manejo de redes y marketing on line",
      "type": "task"
    },
    {
      "description": "Si quieres ayudarnos a mejorar la web, su posicionamiento, su funcionalidad, su dise\u00f1o,...",
      "support": "Dise\u00f1o de la web",
      "type": "task"
    }
  ],
  "node": "euskadi",
  "optimum": 9200.0,
  "owner": "julieta",
  "project-url": "https://goteo.org/project/llevamealhuerto",
  "rewards": [
    {
      "description": "Un gran racimo de sencillas, \u00fatiles y entretenidas p\u00edldoras audiovisuales con las que aprender-ense\u00f1ar a cultivar en cualquier pedazo de tierra que tengas disponible.",
      "icon": "file",
      "license": "ccbyncnd",
      "reward": "V\u00eddeo tutoriales",
      "type": "social"
    },
    {
      "description": "A trav\u00e9s de los v\u00eddeos y sus secciones, de la web, el blog y las noticias relacionadas que difundimos procedentes de otras webs, blogs, redes sociales, etc. queremos, deseamos, intentamos,...aportar un granito de tierra al despertar de la conciencia terr\u00edcola, es decir, al sentimiento de agradecimiento y respeto a la Tierra.",
      "icon": "other",
      "license": null,
      "reward": "Despertar el ADN terr\u00edcola",
      "type": "social"
    },
    {
      "description": "Qui\u00e9nes colaboren con el proyecto aparecer\u00e1n en nuestra web como 'semillas honor\u00edficas' que ayudan al crecimiento y florecimiento de llevamealhuerto.com\r\n",
      "icon": "thanks",
      "license": null,
      "reward": "'Semilla honor\u00edfica'",
      "type": "individual"
    },
    {
      "description": "Te mandaremos un DVD que recopile todos los v\u00eddeotutoriales que hayamos grabado hasta el momento (ya llevamos m\u00e1s de 60!) + Reconocimeinto",
      "icon": "product",
      "license": null,
      "reward": "DVD con todos los v\u00eddeotutoriales",
      "type": "individual"
    },
    {
      "description": "Cesta mediana (2 personas) de verduras y hortalizas de temporada procedentes del caser\u00edo Burgobarri de Mungia, cultivadas por I\u00f1aki, nuestro presentador, a qui\u00e9n conocer\u00e1s personalmente cuando, el d\u00eda acordado, llame a tu puerta para entregarte en mano una cesta de productos del campo + el DVD recopilatorio de los v\u00eddeos emitidos en la Red + Reconocimiento. Las entregas s\u00f3lo se hacen en Bizkaia, pero si no vives por aqu\u00ed, seguro que tienes alguien a quien hacerle un buen regalo ;)",
      "icon": "product",
      "license": null,
      "reward": "Cesta de productos de temporada de nuestra tierra",
      "type": "individual"
    },
    {
      "description": "Cesta familiar (5 personas) de verduras y hortalizas de temporada procedentes del caser\u00edo Burgobarri de Mungia, cultivadas por I\u00f1aki, nuestro presentador, a qui\u00e9n conocer\u00e1s personalmente cuando, el d\u00eda acordado, llame a tu puerta para entregarte en mano una cesta de productos del campo + el DVD recopilatorio de los v\u00eddeos emitidos en la Red + Reconocimiento. Las entregas s\u00f3lo se hacen en Bizkaia, pero si no vives por aqu\u00ed, seguro que tienes alguien a quien hacerle un buen regalo ;)",
      "icon": "product",
      "license": null,
      "reward": "Cesta familiar de productos de temporada de nuestra tierra",
      "type": "individual"
    },
    {
      "description": "Una visita al lugar de cultivo (huerto, jard\u00edn, azotea, balc\u00f3n,..) m\u00e1s la elaboraci\u00f3n de un informe sobre los cultivos y materiales a emplear en funci\u00f3n del espacio, la orientaci\u00f3n, el clima y los gustos del usuario. Adem\u00e1s incluimos un dossier basado en los cursos formativos de I\u00f1aki destinado a ayudarte en el auto-cultivo. El precio incluye salida 40 kms a la redonda desde Bilbao y a partir de ah\u00ed un coste a\u00f1adido por kilometraje de  0,30\u20ac/km. Si est\u00e1s de acuerdo con el informe puedes encargarnos un segundo presupuesto en concepto de dise\u00f1o y materiales a emplear (jardineras, soportes, sustratos , plantas y semillas,...).\r\n+ DVD + Reconocimiento",
      "icon": "service",
      "license": null,
      "reward": "Dise\u00f1o de balc\u00f3n, huerta o jard\u00edn personalizado",
      "type": "individual"
    },
    {
      "description": "Tu logo o marca aparecer\u00e1 al principio de nuestros v\u00eddeos, en un total de 4 cap\u00edtulos, adem\u00e1s de mantener tu ense\u00f1a en nuestra web durante un mes.",
      "icon": "service",
      "license": null,
      "reward": "Patrocinio de tu marca, producto o negocio",
      "type": "individual"
    },
    {
      "description": "Cursos presenciales de 15 horas, a cargo de I\u00f1aki Melgosa, sobre agricultura sostenible, casera, adaptada al espacio y necesidades de las/los cultivadoras/es. El viaje y alojamiento de I\u00f1aki, si el curso se desarrolla muy lejos de Euskadi, correr\u00e1n a cargo de la organizaci\u00f3n, as\u00ed c\u00f3mo el local para impartirlo. \u00a1Aprovecha ahora esta oportunidad antes de que I\u00f1aki salte a la fama!",
      "icon": "service",
      "license": null,
      "reward": "Formaci\u00f3n presencial",
      "type": "individual"
    }
  ],
  "status": "funded",
  "video-url": "http://youtu.be/jUOo7xMoPzI",
  "widget-url": "https://goteo.org/widget/project/llevamealhuerto"
}
```
