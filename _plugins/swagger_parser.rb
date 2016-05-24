# Automatic read Swagger specification from JSON in a url
# _config.yml must be configured with swagger_specs_url var
#
require 'json'

module SwaggerParser


    class Generator < Jekyll::Generator
        def generate(site)
            @dir = "_json"
            @site = site
            @swagger = JSON.parse(File.read(File.join(@site.source, @dir, 'swagger_specs.json')))

            # obtains definitions from swagger
            def get_definitions(id)
                key = id.split('_')[-1]
                definitions = { key => @swagger['definitions'][id]['properties'] }
                for key,value in definitions[key]
                    value['description'] = '...' if not value['description']

                    if(value['items'].respond_to? :each and value['items']['$ref'])
                        ref = value['items']['$ref'].split('/')[-1]
                        _key = ref.split('_')[-1]
                        value['description'] << ' &#9758;<a href="#' + _key + '">' + _key + '</a>'
                        # puts(ref, _key)
                        definitions[_key] = get_definitions(ref)[_key]
                    end
                end
                return definitions
            end

            # obtains the example from a json file in _json
            def get_example(id)
                File.read(File.join(@site.source, @dir, id + '.json'))
            end

            # Markdown table
            def get_definitions_table(data)
                t = ''
                for key,definitions in data
                    t << '##### <a id="' + key + '">' + key + '</a>'
                    t << "\n| Attribute  | Type | Description |\n"
                    t << "|------------|------|-------------|\n"
                    for _key,val in definitions
                        t << "| **#{_key}** | *#{val['type']}* | #{val['description']} |\n"
                    end
                    # puts(t)
                end
                return t
            end

            # Markdown table
            def get_parameters_table(data)
                t = ''
                # puts data
                for key,parameters in data
                    # t << '##### <a id="' + key + '">' + key + '</a>'
                    t << "\n| Attribute  | Type | Description |\n"
                    t << "|------------|------|-------------|\n"
                    for val in parameters
                        puts val
                        type = val['type']
                        t << "| **#{val['name']}** | *#{type}* | #{val['description']} |\n"
                    end
                    # puts(t)
                end
                return t
            end

            # @site.data['swagger'] = swagger
            for key,id in {
                'projects' => 'api_projects_projects_get_Project',
                'project' => 'api_projects_project_get_ProjectFull',
                'users' => 'api_users_users_get_User',
                'user' => 'api_users_user_get_UserFull',
                'categories' => 'api_categories_categories_get_Category',
                'licenses' => 'api_licenses_licenses_get_License',
                }
                @site.data[key] = Hash.new
                @site.data[key]['definitions'] = get_definitions(id)
                @site.data[key]['example'] = get_example(key)
                @site.data[key]['definitions_table'] = get_definitions_table(@site.data[key]['definitions'])
                @site.data[key]['parameters'] = { key => @swagger['paths']['/' + key + '/']['get']['parameters'] }if @swagger['paths']['/' + key + '/'] and @swagger['paths']['/' + key + '/']['get']['parameters']
                # puts "\n--[-\n"
                # puts @site.data[key]['parameters']
                # puts "\n-]--\n--\n"
                @site.data[key]['parameters_table'] = get_parameters_table(@site.data[key]['parameters']) if @site.data[key]['parameters']
                # @site.data[key]['table'] = get_table(@site.data[key]['definitions'])
            end
        end
    end

end
