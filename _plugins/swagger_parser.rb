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

                    # Adding children to definitions and a anchor
                    ref = nil
                    _key = nil
                    if value.has_key? '$ref'
                        ref = value['$ref'].split('/')[-1]
                    elsif value.has_key? 'items' and value['items'].is_a? Hash and value['items'].has_key? '$ref'
                        ref = value['items']['$ref'].split('/')[-1]
                    end
                    if ref and not definitions.has_key? _key
                        _key = ref.split('_')[-1]
                        value['description'] << ' &#9758; [' + _key + '](#' + _key + ')' if not value['description'].include? _key
                        # puts(ref, _key)
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
                    t << '##### <a id="' + key + '">' + key + "</a>\n"
                    t << "| Attribute  | Type | Description |\n"
                    t << "|------------|------|-------------|\n"
                    for _key,val in definitions
                        t << "| #{_key} | #{val['type']} | #{val['description']} |\n"
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
                        t << "| #{val['name']} | #{type} | #{val['description']} |\n"
                    end
                    # puts(t)
                end
                return t
            end

            # @site.data['swagger'] = swagger
            for key,ob in {
                'metaproject' => { 'id' => 'api_projects_projects_get_MetaProject' },
                'metauser' => { 'id' => 'api_users_users_get_MetaUser' },
                'metacategory' => { 'id' => 'api_categories_categories_get_MetaCategory' },
                'metalicense' => { 'id' => 'api_licenses_licenses_get_MetaLicense' },
                'login' => { 'id' => 'api_auth_token_get_Token' },
                # 'projects' => { 'id' => 'api_projects_projects_get_Project' },
                'projects' => { 'id' => 'api_projects_projects_get_ResponseProject' },
                'project' => { 'id' => 'api_projects_project_get_ProjectFull' },
                # 'project_donors' => { 'id' => 'api_projects_project_donors_get_ProjectDonor', 'endpoint' => '/project/{project}/donors/' },
                'project_donors' => { 'id' => 'api_projects_project_donors_get_ResponseDonor', 'endpoint' => '/project/{project}/donors/' },
                # 'users' => { 'id' => 'api_users_users_get_User' },
                'users' => { 'id' => 'api_users_users_get_ResponseUser' },
                'user' => { 'id' => 'api_users_user_get_UserFull' },
                # 'categories' => { 'id' => 'api_categories_categories_get_Category' },
                'categories' => { 'id' => 'api_categories_categories_get_ResponseCategory' },
                # 'licenses' => { 'id' => 'api_licenses_licenses_get_License' },
                'licenses' => { 'id' => 'api_licenses_licenses_get_ResponseLicense' },
                # 'invests' => { 'id' => 'api_invests_invests_get_Invest' },
                'invests' => { 'id' => 'api_invests_invests_get_ResponseInvest' },
                'invest' => { 'id' => 'api_invests_invest_get_InvestFull' },
                # 'calls' => { 'id' => 'api_calls_calls_get_Call' },
                'calls' => { 'id' => 'api_calls_calls_get_ResponseCall' },
                'call' => { 'id' => 'api_calls_call_get_CallFull' },
                # 'call_projects' => { 'id' => 'api_calls_call_projects_get_ProjectCall', 'endpoint' => '/call/{call}/projects/' },
                'call_projects' => { 'id' => 'api_projects_projects_get_ResponseProject', 'endpoint' => '/calls/{call_id}/projects/'  },
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
