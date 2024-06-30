{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {% set config_meta = node.config.get('meta') %}

    {% if config_meta and config_meta is mapping %}
        {% set schema_name = config_meta.get('schema_name') %}
        {% if schema_name and schema_name is string %}
            {{ return(schema_name) }}
        {% endif %}

    {%- elif custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}