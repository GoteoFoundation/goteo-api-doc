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

                    if value['$ref']
                        ref = value['$ref'].split('/')[-1]
                        _key = ref.split('_')[-1]
                        value['description'] << ' &#9758;<a href="#' + _key + '">' + _key + '</a>'
                        puts(ref, _key)
                        definitions[_key] = get_definitions(ref)[_key]
                    end

                    if(value['items'].respond_to? :each and value['items']['$ref'])
                        ref = value['items']['$ref'].split('/')[-1]
                        _key = ref.split('_')[-1]
                        value['description'] << ' &#9758;<a href="#' + _key + '">' + _key + '</a>'
                        puts(ref, _key)
                        definitions[_key] = get_definitions(ref)[_key]
                    end
                end
                return definitions
            end

            # obtains the example from a json file in _json
            def get_example(id)
                f = File.join(@site.source, @dir, id + '.json')
                File.read(f) if File.exists?(f)
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
                        type = val['type']
                        t << "| **#{val['name']}** | *#{type}* | #{val['description']} |\n"
                    end
                    # puts(t)
                end
                return t
            end

            # @site.data['swagger'] = swagger
            for key,ob in {
                'projects' => { 'id' => 'api_projects_projects_get_Project' },
                'project' => { 'id' => 'api_projects_project_get_ProjectFull' },
                'project_donors' => { 'id' => 'api_projects_project_donors_get_ProjectDonor', 'endpoint' => '/project/{project}/donors/' },
                'users' => { 'id' => 'api_users_users_get_User' },
                'user' => { 'id' => 'api_users_user_get_UserFull' },
                'categories' => { 'id' => 'api_categories_categories_get_Category' },
                'licenses' => { 'id' => 'api_licenses_licenses_get_License' },
                'reports_summary' => { 'id' => 'api_reports_reports_summary_get_Summary', 'endpoint' => '/reports/summary/' },
                'reports_community' => { 'id' => 'api_reports_reports_community_get_Community', 'endpoint' => '/reports/community/' },
                'reports_money' => { 'id' => 'api_reports_reports_money_get_Money', 'endpoint' => '/reports/money/' },
                'reports_rewards' => { 'id' => 'api_reports_reports_rewards_get_Reward', 'endpoint' => '/reports/rewards/' },
                'reports_projects' => { 'id' => 'api_reports_reports_projects_get_Project', 'endpoint' => '/reports/projects/' },
                'digests' => { 'id' => 'api_digests_get_Digest', 'endpoint' => '/digests/{endpoint}' },
                'digests1' => { 'id' => 'api_digests_get_Digest' },
                }
                _id = ob['id']
                _key = if ob['endpoint'] then ob['endpoint'] else '/' + key + '/' end
                @site.data[key] = Hash.new
                @site.data[key]['definitions'] = get_definitions(_id)
                @site.data[key]['example'] = get_example(key)
                @site.data[key]['definitions_table'] = get_definitions_table(@site.data[key]['definitions'])
                @site.data[key]['parameters'] = { key => @swagger['paths'][_key]['get']['parameters'] }if @swagger['paths'][_key] and @swagger['paths'][_key]['get']['parameters']
                # puts "\n--[-\n"
                # puts @site.data[key]['parameters']
                # puts "\n-]--\n--\n"
                @site.data[key]['parameters_table'] = get_parameters_table(@site.data[key]['parameters']) if @site.data[key]['parameters']
                # @site.data[key]['table'] = get_table(@site.data[key]['definitions'])
            end
        end
    end

end
