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

Compilation uses the downloaded JSON files in the `_json` folder. A custom plugin, `_plugins/swagger_parser.rb`, automatically parses the downloaded JSON files and adds its content to the Markdown templates.

**Two task are configure for Rake:**

1. Generates documentation as static, off-line HTML files into the `_simple` directory:

    ```bash
    JEKYLL_ENV=simple rake doc:simple
    ```

2. And the automatic publication to the `gh-pages` branch in Github (official documentation):

    ```bash
    rake doc:publish
    ```

