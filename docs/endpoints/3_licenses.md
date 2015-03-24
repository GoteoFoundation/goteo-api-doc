---
layout: default
title: Licenses
group: endpoint
permalink: /doc/licenses/
---
# Licenses endpoint

This section gives you information about the licenses used by project rewards in [Goteo.org](http://goteo.org)

<a name="licenses"></a>
## /licenses/

Obtains a list of licenses.

```bash
curl -i --basic --user "user:key" {{ site.apiurl }}/licenses/
```

### Filters available:
**The [standard set of filters](/doc/filters) applies to this endpoint with these particulars:**

* **from_date** and **to_date** restricts the list to the licenses used in project rewards created between that dates
* **node** restricts the list to the licenses used in project rewards assigned in that nodes
* **category** restricts the list to the licenses used in project rewards in that categories
* **project** restricts the list to the licenses used in rewards for that projects
* **location** restricts the list to the licenses used in project rewards geolocated in that area.

### Response values:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| * **items** | *array* | An array with the list of licenses |
| **meta** | *array* | Additionally, extra information will be provided here (such as  parameter filtering) |

#### * Array sub-fields:

**items** returns an array of the following object:

| Attribute  | Type | Description |
| ------------- | ------------- | ------------ |
| **id** | *string* | Unique identifier for the license in Goteo |
| **name** | *string* | Name of the license |
| **description** | *string* | Description for the license |
| **url** | *string* | URL where to find the license content terms |
| **svg-url** | *string* | URL with the SVG logo of the license |
| **total-projects** | *number* | Number of published projects using the license in some of its rewards |
| **total-rewards** | *number* | Number of rewards using the license for all published projects |

### Response body
```json
{
  "items": [
    {
      "description": "Licencia P\u00fablica General de GNU para la libre distribuci\u00f3n, modificaci\u00f3n y uso de software",
      "id": "gpl2",
      "name": "General Public License (v.2)",
      "svg-url": "http://goteoassets.org/api/svg/licenses/gpl2.svg",
      "total-rewards": 46,
      "url": "http://www.gnu.org/licenses/gpl-2.0.html"
    },
    {
      "description": "Licencia P\u00fablica General de GNU para la libre distribuci\u00f3n, modificaci\u00f3n y uso de software",
      "id": "gpl",
      "name": "General Public License",
      "svg-url": "http://goteoassets.org/api/svg/licenses/gpl.svg",
      "total-rewards": 119,
      "url": "http://www.gnu.org/licenses/gpl.html"
    },
    {
      "description": "Licencia p\u00fablica general de Affero para software libre que corra en servidores de red",
      "id": "agpl",
      "name": "Affero General Public License",
      "svg-url": "http://goteoassets.org/api/svg/licenses/agpl.svg",
      "total-rewards": 34,
      "url": "http://www.affero.org/oagf.html"
    },
    {
      "description": "Licencia de documentaci\u00f3n libre de GNU, pudiendo ser \u00e9sta copiada, redistribuida, modificada e incluso vendida siempre y cuando se mantenga bajo los t\u00e9rminos de esa misma licencia",
      "id": "fdl",
      "name": "Free Documentation License ",
      "svg-url": "http://goteoassets.org/api/svg/licenses/fdl.svg",
      "total-rewards": 40,
      "url": "http://www.gnu.org/copyleft/fdl.html"
    },
    {
      "description": "Licencia Apache de software libre, que no exige que las obras derivadas se distribuyan usando la misma licencia ni como software libre",
      "id": "apache",
      "name": "Apache License",
      "svg-url": "http://goteoassets.org/api/svg/licenses/apache.svg",
      "total-rewards": 2,
      "url": "http://www.apache.org/licenses/LICENSE-2.0"
    },
    {
      "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda",
      "id": "ccby",
      "name": "CC - Reconocimiento",
      "svg-url": "http://goteoassets.org/api/svg/licenses/ccby.svg",
      "total-rewards": 250,
      "url": "http://creativecommons.org/licenses/by/4.0/deed.es_ES"
    },
    {
      "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y sin que se pueda hacer uso comercial",
      "id": "ccbync",
      "name": "CC - Reconocimiento - NoComercial",
      "svg-url": "http://goteoassets.org/api/svg/licenses/ccbync.svg",
      "total-rewards": 274,
      "url": "http://creativecommons.org/licenses/by-nc/2.0/deed.es_ES"
    },
    {
      "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial y a compartir en id\u00e9nticas condiciones",
      "id": "ccbyncsa",
      "name": "CC - Reconocimiento - NoComercial - CompartirIgual",
      "svg-url": "http://goteoassets.org/api/svg/licenses/ccbyncsa.svg",
      "total-rewards": 522,
      "url": "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
    },
    {
      "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda, sin que se pueda hacer uso comercial ni otras obras derivadas",
      "id": "ccbyncnd",
      "name": "CC - Reconocimiento - NoComercial - SinObraDerivada",
      "svg-url": "http://goteoassets.org/api/svg/licenses/ccbyncnd.svg",
      "total-rewards": 257,
      "url": "http://creativecommons.org/licenses/by-nc-nd/2.0/deed.es_ES"
    },
    {
      "description": "Licencia Creative Commons (bienes comunes creativos) con reconocimiento de autor\u00eda y a compartir en id\u00e9nticas condiciones",
      "id": "ccbysa",
      "name": "CC - Reconocimiento - CompartirIgual",
      "svg-url": "http://goteoassets.org/api/svg/licenses/ccbysa.svg",
      "total-rewards": 178,
      "url": "http://creativecommons.org/licenses/by-sa/2.0/deed.es_ES"
    },
    {
      "description": "Licencia para obras de hardware libre",
      "id": "oshw",
      "name": "TAPR Open Hardware License",
      "svg-url": "http://goteoassets.org/api/svg/licenses/oshw.svg",
      "total-rewards": 16,
      "url": "http://www.tapr.org/OHL"
    },
    {
      "description": "Licencia de base de datos abierta, que permite compartir, modificar y utilizar bases de datos en id\u00e9nticas condiciones",
      "id": "odbl",
      "name": "Open Database License ",
      "svg-url": "http://goteoassets.org/api/svg/licenses/odbl.svg",
      "total-rewards": 8,
      "url": "http://www.opendatacommons.org/licenses/odbl/"
    },
    {
      "description": "La obra puede ser libremente reproducida, distribuida, transmitida, usada, modificada, editada u objeto de cualquier otra forma de explotaci\u00f3n para el prop\u00f3sito que sea, comercial o no",
      "id": "pd",
      "name": "Dominio p\u00fablico",
      "svg-url": "http://goteoassets.org/api/svg/licenses/pd.svg",
      "total-rewards": 52,
      "url": "http://creativecommons.org/licenses/publicdomain/deed.es"
    },
    {
      "description": "Licencia Creative Commons de obra dedicada al dominio p\u00fablico, mediante renuncia a todos los derechos de autor\u00eda sobre la misma",
      "id": "cc0",
      "name": "CC0 Universal (Dominio P\u00fablico)",
      "svg-url": "http://goteoassets.org/api/svg/licenses/cc0.svg",
      "total-rewards": 129,
      "url": "http://creativecommons.org/publicdomain/zero/1.0/deed.es"
    },
    {
      "description": "Licencia de arte libre",
      "id": "fal",
      "name": "Free Art License",
      "svg-url": "http://goteoassets.org/api/svg/licenses/fal.svg",
      "total-rewards": 130,
      "url": "http://artlibre.org/lal/es"
    }
  ],
  "meta": {
    "from_date": "2014-01-01",
    "total": 15
  }
}
```