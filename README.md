<img width="916" alt="image" src="https://github.com/user-attachments/assets/8d60bee9-9d0f-4e9f-9d62-74d5f10a4ec5" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/dd978b03-74b9-456e-bedf-d24df79ff069" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/a5b22089-6037-4c88-afea-4e62c83a7960" />

# Resources for the workshop
- [Environment set up](https://github.com/grafana/intro-to-mltp)
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/)
- [Alloy components](https://grafana.com/docs/alloy/latest/reference/components/)

# Alloy 101 
<img width="909" alt="image" src="https://github.com/user-attachments/assets/d37cbbce-2526-443c-83e5-9c0a3a6b481d" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d0f35b76-3aa0-48c6-8678-8310ffc29cdc" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/32c14388-b5e6-4fcb-ba62-c491729c5f2e" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/45bf6e1a-e3de-4809-809a-7268a8a6d367" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/80f3e603-dea7-48fe-80b5-7807431d85e2" />
<img width="917" alt="image" src="https://github.com/user-attachments/assets/0f5c80f3-0b18-45fa-8e4a-3c95a939859d" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/3aca8547-5d47-4b05-b624-297a1adda4e9" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/87e09054-937f-429e-a9e2-7167e1bf65ff" />

## Alloy vocabularies 

### Think of Alloy as our trusty pal who can collect, transform, and deliver our telemetry data. 

In order to instruct Alloy on how we want that done, we must write these instructions in a language (`Alloy syntax`) that Alloy understands. 

![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWZnenp4bThzNzU1cW9oYTkzcW84am9keDRzem1kc2IzZTNlYTRoZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xTiTnuhyBF54B852nK/giphy.gif)

### Imagine that you are writing a set of to do list for Alloy. 
<img width="731" alt="image" src="https://github.com/user-attachments/assets/3599a013-7c43-4e01-896d-78e5c9cf363b" />

A single task is known as a `component` in Alloy.

These components could be put together in any way to form a complete set of instructions on how to collect, transform, and deliver telemetry data. These set of instructions are known as a `pipeline` in Alloy. 

### Each task/component could be further broken down into a detailed set of instructions.
These subtasks/subcomponents are known as `blocks` in Alloy. 

<img width="729" alt="image" src="https://github.com/user-attachments/assets/ed8aa651-f522-45ea-9556-de943f4908f9" />

For example:
```
prometheus.remote_write "default" {
    endpoint {
        url = "http://localhost:9009/api/prom/push"
    }
}
```
The preceding example has two blocks:
- prometheus.remote_write "default":
- A labeled block which instantiates a `prometheus.remote_write` component. The label is the string "default".
- endpoint:
- An unlabeled `block` inside the component that configures an endpoint to send metrics to.
- Within `blocks`, you can further use `attributes` and `expressions` to give Alloy more information on what you would like it to do as a key value pair. 
- You use `expressions` to compute or denote the value of an `attribute`. The simplest `expressions` are constant values like strings, integers, lists, objects, etc.
- This block sets the url `attribute`  equal to the value (`expression`) of the url ("http://localhost:9009/api/prom/push").

# Environment overview
<img width="1433" alt="image" src="https://github.com/user-attachments/assets/6fd37912-58ab-4620-a246-6babc04d8f5d" />

# Best practices for building pipelines with Alloy

*Whenever possible*
- We recommend Prometheus instrumentation for Infrastructure Observability and OTel instrumentation for Application Observability.
- We strongly recommend collecting all the telemetry types of a given monitored component using one single ecosystem: either Prometheus/Loki or OTel, but not a mix of both.

* Not every telemetry collection scenario are clear cut where you can perfectly follow these recommendations. In those cases, you will have to get telemetry however you can and connect the signals while mixing ecosystems. You will see an example of this in this workshop. 

# Infrastructure Observability
Prometheus/Promtail telemetry should be
- collected using Alloy prometheus.* , loki.* , and discovery.* components
- enriched using the Alloy Prometheus and Promtail/Loki components
- sent to Grafana Cloud using the Prometheus Remote Write and Loki Endpoints

## Building pipelines for metrics and logs for infra o11y
<img width="906" alt="image" src="https://github.com/user-attachments/assets/009c2fb1-bb9c-45ae-aa01-b4cb645abb9c" />

### Components used in this section: 
- [prometheus.scrape](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/)
- [prometheus.remote_write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/)
- [prometheus.exporter.postgres](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.exporter.postgres/)
- [prometheus.relabel](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/)
- [loki.source.api](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.source.api/)
- [loki.process](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/)
- [loki.write](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/)
  
### Final configuration for the Prometheus and Loki pipelines

<img width="914" alt="image" src="https://github.com/user-attachments/assets/99fd09a8-d95b-444c-a070-663cb9ce18aa" />

**The Prometheus pipeline**
1) scrapes metrics from the local Alloy collector and Postgres database
2) adds the label 'group' to all metrics with a value of 'infrastructure'
3) writes metrics to the Mimir database.

```
//Prometheus pipeline
prometheus.scrape "alloy" {
    targets = [{"__address__" = "localhost:12345", group = "infrastructure", service = "alloy"}]

    scrape_interval = "2s"
    scrape_timeout  = "2s"

    forward_to = [prometheus.remote_write.mimir.receiver]

    job_name = "alloy"
}

prometheus.exporter.postgres "mythical" {
    data_source_names = ["postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable"]
}

prometheus.scrape "postgres" {
    targets = prometheus.exporter.postgres.mythical.targets

    scrape_interval = "2s"
    scrape_timeout  = "2s"

    forward_to = [prometheus.relabel.postgres.receiver]

    job_name = "postgres"
}

prometheus.relabel "postgres" {
    forward_to = [prometheus.remote_write.mimir.receiver]

    rule {
        action       = "replace"
        target_label = "group"
        replacement  = "infrastructure"
    }

    rule {
        action       = "replace"
        target_label = "service"
        replacement  = "postgres"
    }
}

prometheus.remote_write "mimir" {
    endpoint {
        url = "http://mimir:9009/api/v1/push"
    }
}
```

### Prometheus pipeline explained
The first step is to scrape metrics from our infrastructure (local Alloy collector and Postgres DB).

*Alloy*
```
prometheus.scrape "alloy" {
    targets = [{"__address__" = "localhost:12345", group = "infrastructure", service = "alloy"}]

    scrape_interval = "2s"
    scrape_timeout  = "2s"

    forward_to = [prometheus.remote_write.mimir.receiver]

    job_name = "alloy"
}
```
This `prometheus.scrape` component 
- scrapes metrics from the `targets` we define (in this case is our local Alloy collector) and instructs alloy to scrape every 2 seconds and timeout if it cannot within 2 seconds. 
- forwards the metrics to a `prometheus.remote_write.mimir.receiver` component which we will define shortly.
- attaches a job name ("alloy") to the metrics. Specifying a job name is useful to identify scraped targets and group metrics so it could be easily queried.

*Postgres DB*
- We take a similar approach when instructing Alloy to scrape metrics from the Postgres database.  
- Through the `prometheus.exporter.postgres` component, we inform Alloy which Postgres database we want it to connect to. 
- We use the `prometheus.scrape` component which we label "postgres".
- We tell Alloy that we want to scrape metrics from the database and forward the data to the `prometheus.relabel.postgres.receiver` component we will define in the next step.
-  We define the `scrape_interval` and `scrape_timeout`.
- We label the job_name as "postgres".
  
```
prometheus.exporter.postgres "mythical" {
    data_source_names = ["postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable"]
}

prometheus.scrape "postgres" {
    targets = prometheus.exporter.postgres.mythical.targets

    scrape_interval = "2s"
    scrape_timeout  = "2s"

    forward_to = [prometheus.relabel.postgres.receiver]

    job_name = "postgres"
}
```
*Data transformation*
- We will use the `prometheus.relabel` component to relabel metrics data we are scraping from the Postgres database.
- We instruct Alloy to send (`forward_to`) the transformed data to the `prometheus.remote_write.mimir.receiver` component. 
- We define two rules to define the relabeling operations we would like to perform. 
- The first rule adds a new label called `group="infrastructure"` to metrics scraped from the Postgres database. 
- The second rule adds a new label called `service="postgres"` to metrics scraped from the Postgres database. 

- Note that the rules are evaluated top down, so the order matters! 
```
prometheus.relabel "postgres" {
    forward_to = [prometheus.remote_write.mimir.receiver]

    rule {
        action       = "replace"
        target_label = "group"
        replacement  = "infrastructure"
    }

    rule {
        action       = "replace"
        target_label = "service"
        replacement  = "postgres"
    }
}
```
*Send scraped metrics to the Mimir database*

`prometheus.remote_write "mimir"` component is responsible for delivering Prometheus metrics to one or more Prometheus-compatible endpoints.

The full URL of the Prometheus-compatible endpoint where metrics are sent, such as "http://mimir:9009/api/v1/push" for Mimir. The endpoint URL depends on the database you use.

```
prometheus.remote_write "mimir" {
    endpoint {
        url = "http://mimir:9009/api/v1/push"
    }
}
```

If your endpoint requires basic authentication, paste the following inside the endpoint block.
```
basic_auth {
    username = "<USERNAME>"
    password = "<PASSWORD>"
}
```
Replace the following:

- USERNAME: The basic authentication username.
- PASSWORD: The basic authentication password or API key.

*If you have more than one endpoint to write metrics to, repeat the endpoint block for additional endpoints.*

#### Example
```
prometheus.remote_write "default" {
    endpoint {
        url = "http://localhost:9090/api/prom/push"
    }

    endpoint {
        url = "https://prometheus-us-central1.grafana.net/api/prom/push"

        // Get basic authentication based on environment variables.
        basic_auth {
            username = sys.env("<REMOTE_WRITE_USERNAME>")
            password = sys.env("<REMOTE_WRITE_PASSWORD>")
        }
    }
}

prometheus.scrape "example" {
    // Collect metrics from the default listen address.
    targets = [{
        __address__ = "127.0.0.1:12345",
    }]

    forward_to = [prometheus.remote_write.default.receiver]
}
```

**The Loki pipeline**
1) the logging block takes Alloy's logs in memory from the local Alloy collector and forwards them to the relabel component
* it instructs Alloy to output logs in the standard log format, allow logs with level "debug" or higher, then send the logs to `loki.relabel` component
2) adds a new label `"service" = "alloy"` to each log line 
3) forwards transformed logs to the `loki.write` component that sends logs to a local Loki database. 

```alloy
logging {
    format     = "logfmt"
    level      = "debug"
    write_to   = [loki.relabel.alloy_logs.receiver]
}

loki.relabel "alloy_logs" {
    rule {
        target_label = "service"
        replacement  = "alloy"
    }

    forward_to = [loki.write.mythical.receiver]
}

loki.write "mythical" {
    endpoint {
        url = "http://loki:3100/loki/api/v1/push"
    }
}
```

# Application Observability

OTel telemetry should be
- collected using OTel SDKs and OTel Collector Receivers
- enriched and exported using OTel Collector processors, connectors, and exporters
- sent to Grafana Cloud using the Grafana Cloud OTLP Endpoint

## Building OTel pipelines for traces and logs

### Components used in this section
- [otelcol.receiver.otlp](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/)
- [otelcol.processor.batch](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.batch/)
- [otelcol.connector.spanlogs](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.connector.spanlogs/)
- [otecol.exporter.otlp](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlp/)
- [otelcol.exporter.loki](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.loki/)
- [loki.process](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/)
- [loki.write](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/)

### Final configuration for OTel pipeline

**The OTel pipeline**
1. receives all incoming trace spans from the mythical applications
2. sends batches of ingested traces to a local Tempo instance
3. sends the ingested traces to a OTel spanlog connector to generate logs from the traces and sends the generated logs to a local Loki instance

<img width="906" alt="image" src="https://github.com/user-attachments/assets/3010d37d-57f9-4100-a7ba-19bda016186b" />

```
otelcol.receiver.otlp "otlp_receiver" {
    grpc {
        endpoint = "0.0.0.0:4317"
    }
    http {
        endpoint = "0.0.0.0:4318"
    }

    output {
        traces = [
            otelcol.processor.batch.default.input,
            otelcol.connector.spanlogs.autologging.input,
        ]
    }
}

otelcol.processor.batch "default" {
    send_batch_size = 1000
    send_batch_max_size = 2000

    timeout = "2s"

    output {
        traces = [otelcol.exporter.otlp.tempo.input]
    }
}

otelcol.exporter.otlp "tempo" {
    client {
        endpoint = "http://tempo:4317"

        tls {
            insecure = true
            insecure_skip_verify = true
        }
    }
}

otelcol.connector.spanlogs "autologging" {
    spans = false
    roots = true
    processes = false

    span_attributes = [ "http.method", "http.target", "http.status_code" ]

    overrides {
        trace_id_key = "traceId"
    }

    output {
        logs = [otelcol.exporter.loki.autologging.input]
    }
}

otelcol.exporter.loki "autologging" {
    forward_to = [loki.process.autologging.receiver]
}


loki.process "autologging" {
    stage.json {
        expressions = { "body" = "" }
    }

    stage.output {
        source = "body"
    }

    forward_to = [loki.write.autologging.receiver]
}

loki.write "autologging" {
   
    external_labels = {
        job = "alloy",
    }

    endpoint {
        url = json_path(local.file.endpoints.content, ".logs.url")[0]

        basic_auth {
            username = json_path(local.file.endpoints.content, ".logs.basicAuth.username")[0]
            password = json_path(local.file.endpoints.content, ".logs.basicAuth.password")[0]
        }
    }
}
```

### OTel pipeline explained
```
otelcol.receiver.otlp "otlp_receiver" {
    grpc {
        endpoint = "0.0.0.0:4317"
    }
    http {
        endpoint = "0.0.0.0:4318"
    }

    output {
        traces = [
            otelcol.processor.batch.default.input,
            otelcol.connector.spanlogs.autologging.input,
        ]
    }
}
```
- The trace spans get sent to the `otelcol.receiver.otlp` component. 
grpc and http  endpoints are standard ports that are listening for OTLP spans (4317 and 4318 are standarrd default ports). 
- The traces are then sent to `otelcol.processor.batch` component and the `otelcol.conenctor.spanlogs` component

```
otelcol.processor.batch "default" {
    send_batch_size = 1000
    send_batch_max_size = 2000

    timeout = "2s"

    output {
        traces = [otelcol.exporter.otlp.tempo.input]
    }
}

```
- The `otelcol.processor.batch` components puts incoming trace spans in batches to reduce network connections and increase compression ratios of outgoing data. 
- Batched data is sent to teh `otelcol.expoerter.otlp` component

```otelcol.exporter.otlp "tempo" {
    client {
        endpoint = "http://tempo:4317"

        tls {
            insecure = true
            insecure_skip_verify = true
        }
    }
}
```
- The `otelcol.exporter.oltp` component sends traces to the local Tempo instance.
- The tls block allows us to send traces over a non HTTPS connection as well as omit authentification

```
otelcol.connector.spanlogs "autologging" {
    spans = false
    roots = true

    span_attributes = [ "http.method", "http.target", "http.status_code" ]

    overrides {
        trace_id_key = "traceId"
    }

    output {
        logs = [otelcol.exporter.loki.autologging.input]
    }
}

```
- The `otelcol.connector.spanlogs` component receives traces from the `otelcol.receiver.otlp` component. 
- It instructs Alloy to only generate a log once we have a full trace (spans = falls, roots = true)
- It adds the following span attributes ("http.method", "http.target", "http.status_code") to the logs
- It instructs Alloy to replace the default a field in the log "tid" with "traceId"
- It sends spanlogs tothe `otelcol.exporter.loki` component we will create in the next step

```
otelcol.exporter.loki "autologging" {
    forward_to = [loki.process.autologging.receiver]
}

```
- We create the `otelcol.exporter.loki` component to instruct Alloy to convert otlp formatted spanlogs to Loki format.
* We do this so we can easily convert JSON to logfmt consistent with logs already stored in Loki

```
loki.process "autologging" {
    stage.json {
        expressions = { "body" = "" }
    }

    stage.output {
        source = "body"
    }

    forward_to = [loki.write.autologging.receiver]
}
```
- The `loki.process` component parses the log contents as JSON, specifically the key "body" for use in subsequent stages.
- It changes the actual log content to be logfmt andn forwards it to the `loki.write` component we will define in the next step. 

```
loki.write "autologging" {
   
    external_labels = {
        job = "alloy",
    }

    endpoint {
        url = json_path(local.file.endpoints.content, ".logs.url")[0]

        basic_auth {
            username = json_path(local.file.endpoints.content, ".logs.basicAuth.username")[0]
            password = json_path(local.file.endpoints.content, ".logs.basicAuth.password")[0]
        }
    }
}
```
- This component sends spanlogs to the local Loki and adds a label `job = "alloy"` to make spanlogs queryable. 

# Group exercise 
Infrastructure O11y
- Scrape metrics from the Postgres database
- Relabel "service" = "group" 
- Drop an entire metric (enter metric name here)
- Extract log level and add it as a label

App O11y
- Loki.process parse timestamp of the log

# Debugging
<img width="909" alt="image" src="https://github.com/user-attachments/assets/8f97d371-d234-48be-b948-1577cdb0f0e7" />

# Q & A
![Alt Text](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXU1ZnNwazRmbXdmcGMzZmNueWd3eTk4aWJlNmI0dHd6OXR5azh3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT5LMB2WiOdjpB7K4o/giphy.gif)
