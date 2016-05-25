# Goteo API Documentation

This is the source code for the Goteo's [API documentation](https://developers.goteo.org/doc/)

This documentation is mostly automated by reading the [swagger specs]({{ site.api_spec }}) from the api.

Swagger JSON files are needed to generate the documentation, they can be retrieved with the command `generate_examples.sh`:

```bash
./generate_examples.sh -u user:key -a https://api.goteo.org/v1/
```

They'll be copied to the `_json` folder

For compilation we use [Jekyll](https://jekyllrb.com/), install dependencies as the explain in [Github](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll) and start a live preview with this command:

```bash
jekyll serve
```


Finally, an automatic publication to the `gh-pages` branch can be achieved with this Rake task:

```bash
rake doc:publish
```

