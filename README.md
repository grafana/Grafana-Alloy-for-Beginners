# Building OpenTelemetry and Prometheus native telemetry pipelines with Grafana Alloy

<img width="917" alt="image" src="https://github.com/user-attachments/assets/9217f310-39c8-4baa-b748-0a19cc40a5ba" />
<img width="912" alt="image" src="https://github.com/user-attachments/assets/6cc578a3-2531-41e2-aecc-bd505fd39b49" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/560bb25a-2c00-483d-a346-130a1e1a7805" />
<img width="909" alt="image" src="https://github.com/user-attachments/assets/ce517e52-2414-4ca5-9c9d-3b9b1ef26e71" />

## Resources for the workshop

- [Workshop repo](https://github.com/spartan0x117/intro-to-mltp/tree/main)
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/)
  - [Alloy configuration blocks](https://grafana.com/docs/alloy/latest/reference/config-blocks/)
  - [Alloy components](https://grafana.com/docs/alloy/latest/reference/components/)
  - [Collect and forward data with Grafana Alloy](https://grafana.com/docs/alloy/latest/collect/)
  - [Grafana Alloy Tutorials](https://grafana.com/docs/alloy/latest/tutorials/)


<img width="912" alt="image" src="https://github.com/user-attachments/assets/bc1467ea-b76b-4a8f-97af-91de818b07b6" />

## Environment set up
Before getting started, make sure you:
- install [Docker](https://www.docker.com/products/docker-desktop/) and [Docker Compose](https://docs.docker.com/compose/install/) 
- clone the [repo](https://github.com/spartan0x117/intro-to-mltp) for the lab environment :
```
git clone https://github.com/spartan0x117/intro-to-mltp.git
```
- start a new command-line interface in your Operating System and run: 
```
docker compose up --build -d
```
# Alloy 101 
<img width="909" alt="image" src="https://github.com/user-attachments/assets/d37cbbce-2526-443c-83e5-9c0a3a6b481d" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/d0f35b76-3aa0-48c6-8678-8310ffc29cdc" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/d2497157-e1ae-466a-8206-3fcf5dbb1616" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/f2aca8c7-a63c-4735-aceb-c5f64155cefc" />
<img width="912" alt="image" src="https://github.com/user-attachments/assets/85f2ea42-93d3-4477-be06-edaf84af1800" />
<img width="907" alt="image" src="https://github.com/user-attachments/assets/d669cbc0-dad6-4997-99dc-fed755b3c295" />
<img width="916" alt="image" src="https://github.com/user-attachments/assets/8e8422f6-205b-46e0-b19c-09eb4dbebd31" />
<img width="915" alt="image" src="https://github.com/user-attachments/assets/87e09054-937f-429e-a9e2-7167e1bf65ff" />

## Alloy syntax

### Think of Alloy as our trusty pal who can collect, transform, and deliver our telemetry data. 

To instruct Alloy on how we want that done, we must write these instructions in a language (`Alloy syntax`) that Alloy understands. 

![Alt Text](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWZnenp4bThzNzU1cW9oYTkzcW84am9keDRzem1kc2IzZTNlYTRoZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xTiTnuhyBF54B852nK/giphy.gif)

### Imagine that you are writing a set of to do lists for Alloy. 
<img width="723" alt="image" src="https://github.com/user-attachments/assets/62cb6b85-81c5-4be0-953a-8c4b94132234" />

A single task is known as a `component` in Alloy.

<img width="946" alt="image" src="https://github.com/user-attachments/assets/f89dfcdd-4455-4065-9845-88c9dde48bfc" />

Components perform different functions.
<img width="944" alt="image" src="https://github.com/user-attachments/assets/f9e5d02d-3558-4022-a289-062d4a93dceb" />
<img width="933" alt="image" src="https://github.com/user-attachments/assets/d3cdbf2f-73ee-44d7-aba1-86414ec64f30" />

### When figuring out which components to use, focus your attention to what comes after the name of the ecosystem to figure out what that component does. 

For example, let's take a look at Prometheus components: 
<img width="944" alt="image" src="https://github.com/user-attachments/assets/28d46b11-664a-43fb-ae96-095d3c9c5173" />

<img width="933" alt="image" src="https://github.com/user-attachments/assets/ed57c093-72be-4e24-9d23-ed96e4d541cf" />

These `components` could be put together in any way to form a complete set of instructions on how to collect, transform, and deliver telemetry data. This set of instructions is known as a `pipeline` in Alloy. 

<img width="922" alt="image" src="https://github.com/user-attachments/assets/0a1f9983-271f-4928-a70c-038da9985d44" />
<img width="938" alt="image" src="https://github.com/user-attachments/assets/1250387f-7e0e-4577-8ecb-332af321730c" />
<img width="940" alt="image" src="https://github.com/user-attachments/assets/56e5dbdf-57d1-43bb-87b7-6e1cf6efb13e" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/47390611-2110-4609-b639-08d15d13ddcd" />

### While reading up on components within the Alloy docs, pay special attention to the following sections:
- usage
- arguments
- blocks

The `usage` section gives you an example of how this particular component could be configured. 
<img width="911" alt="image" src="https://github.com/user-attachments/assets/add64bd4-0831-46eb-9041-0757eaae8d67" />

The `arguments` and `blocks` sections list what you could do with the data. Pay close attention to the name, type, description, default, and required columns so Alloy could understand what you want it to do! 
<img width="911" alt="image" src="https://github.com/user-attachments/assets/53b1ecea-5818-420e-bc10-151309afd9d8" />
<img width="914" alt="image" src="https://github.com/user-attachments/assets/a4ae1137-1ff6-423d-8977-28246e1bbe0e" />


# Hands on lab

## Best practices for building pipelines with Alloy
*Whenever possible*
- We recommend Prometheus instrumentation for Infrastructure Observability and OTel instrumentation for Application Observability.
- We strongly recommend avoiding conversion of telemetry between formats. 
  - Prometheus metrics should not be converted into OTLP and vice versa


*Not every telemetry collection scenario is clear cut where you can perfectly follow these recommendations. In those cases, you will have to get telemetry however you can and connect the signals while mixing ecosystems. You will see an example of this in this workshop.* 

## Lab environment overview
<img width="1433" alt="image" src="https://github.com/user-attachments/assets/6fd37912-58ab-4620-a246-6babc04d8f5d" />

## Common tasks
We will be using the `config.alloy` file to build pipelines for Infrastructure Observability and Applications Observability. 

Whenever we make changes to the file, we must reload the config. 

### Reloading the config

To reload Alloy's config, hit the following endpoint in a browser or with a tool like `curl`:

```bash
curl -X POST http://localhost:12347/-/reload
```

If the config is valid, you should see a response like the following:

```
config reloaded
```
## Infrastructure Observability - collect, transform, and export logs and metrics
### Section 1: Collect and transform logs from Alloy
#### Objectives

- Collect logs from Alloy using the [`logging`](https://grafana.com/docs/alloy/latest/reference/config-blocks/logging/) block
- Use [`loki.relabel`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.relabel/) to add labels to the logs
- Use [`loki.write`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/) to write the logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following starter code into it:

```alloy/config.alloy
//Section 1

logging {
  format = "//TODO: Fill this in"
  level  = "//TODO: Fill this in"
  write_to = [//TODO: Fill this in]
}

loki.relabel "alloy_logs" {
   forward_to = [//TODO: Fill this in]

    rule {
        target_label = "//TODO: Fill this in"
        replacement = "//TODO: Fill this in"
    }

    rule {
        target_label = "//TODO: Fill this in"
        replacement = "//TODO: Fill this in" 
    }
}

loki.write "mythical" {
    endpoint {
       url = "//TODO: Fill this in"
    } 
}
```

For the `logging` block, we want to set the log format to "logfmt" and the log level to "debug" and write the logs to the `loki.relabel.alloy_logs` component's receiver.

For the `loki.relabel` component, we want to set the `group` label to "infrastructure" and the `service` label to "alloy" and forward the logs to the `loki.write.mythical` component's receiver.

For the `loki.write` component, we want to ship the logs to `http://loki:3100/loki/api/v1/push`.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/887f206b-683f-4107-aaf3-cb891c2226d1" />

Make sure to [reload the config](#reloading-the-config) after filling in the blocks!

#### Verification

Navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `Section 1 Verification` dashboard.

You should see the panels populated with data, showing the number of logs being sent by Alloy as well as the logs themselves.

<img width="911" alt="image" src="https://github.com/user-attachments/assets/07d04e94-caa5-4316-92dc-a50ebfdb333a" />

### Section 2: Collect and transform infrastructure metrics

#### Objectives

- Use the [discovery.http](https://grafana.com/docs/alloy/latest/reference/components/discovery/discovery.http/) component to discover the targets to scrape
- Scrape the targets' metrics using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use [`prometheus.remote_write`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/)to write the metrics to the locally running Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
discovery.http "service_discovery" {
    url = "//TODO: Fill this in" 
}

prometheus.scrape "infrastructure" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets    = //TODO: Fill this in
    forward_to = [//TODO: Fill this in]
}

prometheus.remote_write "mimir" {
   endpoint {
    url = "//TODO: Fill this in"
   }
}
```

For this section, we would like to use `discovery.http` to find our infrastructure targets to scrape. 

`discovery.http` is a component that polls a given URL for targets to scrape in JSON format. These targets are then exported for other components to use. In our demo environment, we have a service that exposes the targets to scrape in the `http://service-discovery/targets.json` endpoint. 

These targets look something like:

```json
[
    {
        "targets": ["loki:3100"],
        "labels": {
            "service": "loki"
        }
    }
]
```

We will use a `prometheus.scrape` component to scrape metrics from the discovered targets.

As a last step, we will configure the `prometheus.remote_write` component to write the metrics to a local Mimir database ("http://mimir:9009/api/v1/push")

<img width="912" alt="image" src="https://github.com/user-attachments/assets/0abd1cd4-5a2d-4507-9e18-a1dc7d709779" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `Section 2 Verification` dashboard.

You should see an `up` value of 1 for the Loki, Mimir, Tempo, and Pyroscope services.

<img width="911" alt="image" src="https://github.com/user-attachments/assets/a7f7d7f8-e0d8-4cc2-b76a-c0d03e55d8d5" />

#### Alloy UI
<img width="912" alt="image" src="https://github.com/user-attachments/assets/2f6ac758-465f-4149-8c61-893267b4c1b1" />
<img width="910" alt="image" src="https://github.com/user-attachments/assets/9da73817-c746-413b-a155-82d3b571c045" />
<img width="914" alt="image" src="https://github.com/user-attachments/assets/a6087f12-c453-42ed-b333-cf8ff9fd29d7" />
<img width="916" alt="image" src="https://github.com/user-attachments/assets/f39f322c-d0dc-420e-b3d3-4e2777c8c326" />


### Section 3: Collect and transfrom metrics from Postgres DB

#### Objectives

- Expose metrics from the Postgres DB using the [`prometheus.exporter.postgres](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.exporter.postgres/) component
- Collect metrics from Postgres using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use the [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to 
  - add the `group="infrastructure"` and `service="postgres"` labels
  - replace the value of 'instance' label for a value that matches the regex ("^postgresql://([^/]+)")
- [Write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) the metrics to Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
prometheus.exporter.postgres "mythical" {
    data_source_names = ["postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable"]
}

prometheus.scrape "postgres" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets    =  TODO: Fill this in
    forward_to =  [//TODO: Fill this in]
}

prometheus.relabel "postgres" {
    forward_to =  [//TODO: Fill this in]

    rule {
        target_label = "//TODO: Fill this in"
        replacement  = "//TODO: Fill this in"
    }
    
    rule {
        target_label = "//TODO: Fill this in"
        replacement  = "//TODO: Fill this in"
    }

 //What we have: postgres_table_rows_count{instance="postgresql://mythical-database:5432/postgres"}
 //What we want: postgres_table_rows_count{instance="mythical-database:5432/postgres"}
    
    rule {
        // Replace the targeted label.
        action        = "//TODO: Fill this in"

        // The label we want to replace is 'instance'.
        target_label  = "//TODO: Fill this in"

        // Look in the existing 'instance' label for a value that matches the regex.
        source_labels = ["//TODO: Fill this in"]
        regex         = "^postgresql://(.+)"
        
        // Use the first value found in the 'instance' label that matches the regex as the replacement value.
        replacement   = "$1"
    }
}
```

For the `prometheus.scrape` component, we want to scrape the `prometheus.exporter.postgres.mythical` component's targets and forward the metrics to the `prometheus.relabel.postgres` component's receiver.

For the `prometheus.relabel` component, we want to add the `group="infrastructure"` and `service="postgres"` labels to the metrics.

We also want to modify the `instance` label to clean it up. The regex `"^postgresql://(.+)"` will extract the value after `postgresql://`.

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to Dashboards > `Section 3 Verification` and you should see a dashboard populating with Postgres metrics. 
You should also see an instance value of `mythical-database:5432/postgres` instead of `postgresql://mythical-database:5432/postgres`.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/5907b198-b732-4b7d-a0a5-65dcf47f7e4c" />

## Application Observability - collect, transform, and export traces and logs

### Section 4: Collect and transform metrics from Mythical-Services

#### Objectives

- Collect metrics from the Mythical services using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- [Write](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) metrics to locally running Mimir using the [`prometheus.write.queue`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.write.queue/) component

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
prometheus.scrape "mythical" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets    =  [
        {"__address__"= "//TODO: Fill this in", group = "//TODO: Fill this in", service = "//TODO: Fill this in"},
        {"//TODO: Fill this in"}, 
        ]
    forward_to =  [//TODO: Fill this in]
}

prometheus.write.queue "experimental" {
    endpoint "mimir" {
        "//TODO: Fill this in"
    }
}

```
For the `prometheus.scrape` component, we can define scrape targets for mythical services directly by creating a scrape object. Scrape targets are defined as a list of maps, where each map contains a `__address__` key with the address of the target to scrape. 

Any non-double-underscore keys are used as labels for the target.
For example, the following scrape object will scrape Mimir's metrics endpoint and add `env="demo"` and `service="mimir"` labels to the target:

```alloy
targets = [{"__address__" = "mimir:9009",  env = "demo", service = "mimir"}]
```

For this exercise, create two targets using the following addresses. 

- mythical-server: "mythical-server:4000"
- mythical-requester: "mythical-requester:4001"

Add the following labels for each target. 
- mythical-server:
  - group = "mythical", service = "mythical-server"
- mythical-requester:
  - group = "mythical", service = "mythical-requester"

Forward the metrics to the `prometheus.write.queue` component we will define next. 

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to Dashboards > `Section 4 Verification` and you should see a panel with the request rate per beast flowing!

<img width="909" alt="image" src="https://github.com/user-attachments/assets/e3271544-b277-4114-a969-733ce4da064b" />

### Section 5: Ingesting OTel traces

#### Objectives

- [Receive](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/) spans from the Mythical services and Beyla
- [Batch spans](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.batch/) for efficient processing
- [Write](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlp/) the spans to a local instance of Tempo

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
otelcol.receiver.otlp "otlp_receiver" {
    grpc {
        endpoint = "//TODO: Fill in the default value shown in the doc"
    }
    http {
        endpoint = "//TODO: Fill in the default value shown in the doc"
    }
    output {
        traces = [
            //TODO: Fill this in,
        ]
    }
}

otelcol.processor.batch "default" {
    output {
        traces = [
            //TODO: Fill this in,
            ]
    }

    send_batch_size = //TODO: Fill this in 
	  send_batch_max_size = //TODO: Fill this in

	  timeout = "//TODO: Fill this in"
}

otelcol.exporter.otlp "tempo" {
    client {
        endpoint = "//TODO: Fill this in"

        // This is a local instance of Tempo, so we can skip TLS verification
        tls {
            insecure             = true
            insecure_skip_verify = true
        }
    }
}


```

The batch processor will batch spans until a batch size or a timeout is met, before sending those batches on to another component. 
Let's configure it to batch minimum 1000 spans, up to 2000 spans, or until 2 seconds have elapsed.

The Tempo url is `http://tempo:4317`.

<img width="915" alt="image" src="https://github.com/user-attachments/assets/1e3dedbe-d69b-47b6-b7e0-ee3a2ae740e7" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Section 5 Verification` and you should see a dashboard with a populated service graph, table of traces coming from the mythical-requester, and the rate of span ingestion by Tempo

<img width="917" alt="image" src="https://github.com/user-attachments/assets/564236f6-e3b5-430c-a963-2f7509960e5c" />

You can also navigate to [Dashboards](http://localhost:3000/dashboards) > `MLT Dashboard`. These dashboards are configured to use the metrics
from Spanmetrics, so you should see data for the spans we're ingesting.

<img width="914" alt="image" src="https://github.com/user-attachments/assets/d0822e32-0af2-4f13-b6de-2c037d2e8a93" />

### Section 6: Ingesting application logs

<img width="915" alt="image" src="https://github.com/user-attachments/assets/f5f2384a-35b4-4796-89a5-d3a0f2598327" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/8b8afaa5-ade1-4c5a-9935-6ccb607af0f9" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/4bbea9f2-28a4-4cb4-9a5b-fabe4e848fc6" />

#### Objectives

- Ingest application logs sent from the mythical services using the [`loki.source.api`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.source.api/) component
- Use the [`loki.process`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/) component to:
  - add a static `service="mythical" label
  - extract the timestamp from the log line using `stage.regex` with this regex: `^.*?loggedtime=(?P<loggedtime>\S+)`
  - set the timestamp of the log to the extracted timestamp
  - Forward the processed logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
loki.source.api "mythical" {
     http {
        listen_address = "0.0.0.0"
        listen_port    = "3100"
    }
    forward_to = [//TODO: Fill this in]
}

loki.process "mythical" {
    stage.static_labels {
        values = {
           //TODO: Fill this in = "//TODO: Fill this in",        
        }
    }
   stage.regex {
        expression=`^.*?loggedtime=(?P<loggedtime>\S+)`
   }

   stage.timestamp {
        source = "//TODO: Fill this in"
        format = "2006-01-02T15:04:05.000Z07:00"
    }

    forward_to = [loki.write.mythical.receiver]
}
```
#### Verification

Navigate to Dashboards > `Section 6 Verification` and you should see a dashboard with the rate of logs coming from the mythical apps as well as panels showing the logs themselves for the server and requester

<img width="913" alt="image" src="https://github.com/user-attachments/assets/01b5718b-aa1c-47d6-92a1-206aca81066c" />

### Section 7: Spanlogs

#### Objectives

- Take the traces we're already ingesting and [convert them to logs (spanlogs)](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.connector.spanlogs/)
- [Convert](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.loki/) the logs to Loki-formatted log entries and forward them to the `loki.processor`. 
- Use [`loki.process`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/) to convert the format and add attributes to the logs
- Forward the processed logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
otelcol.connector.spanlogs "autologging" {
    roots = // TODO: Fill this in
    spans = // TODO: Fill this in
    processes = // TODO: Fill this in

    span_attributes = ["// TODO: Fill this in", "// TODO: Fill this in", "// TODO: Fill this in"]
    //these are the span attributes that I would like to include in the logs

    output {
    logs = [// TODO: Fill this in]
  }
}

otelcol.exporter.loki "autologging" {
    forward_to = [// TODO: Fill this in]
}

// The Loki processor allows us to accept a Loki-formatted log entry and mutate it into
// a set of fields for output.
loki.process "autologging" {
    stage.json {
       expressions = {"body" = ""}
    }

    stage.output {
       source = "body"
    }

    stage.logfmt {
        mapping = {
            http_method_extracted = "// TODO: Fill this in",
            http_status_code_extracted = "// TODO: Fill this in", 
            http_target_extracted = "// TODO: Fill this in", 

        }
    }

    stage.labels {
        values = {
            method = "// TODO: Fill this in", 
            status = "// TODO: Fill this in",
            target = "// TODO: Fill this in", 
        }
    }

    forward_to = [// TODO: Fill this in]
}
```
**`otelcol.connector.spanlogs`**

For the `otelcol.connector.spanlogs` component to work, we will need to forward the spans from the `otelcol.receiver.otlp`'s output > traces we have defined in section 5 to the `otelcol.connector.spanlogs`'s input.

We'd like to make sure to only generate a log for each full trace(root), not for each span or process (that would be a lot of logs!).

We should also make sure to include the `http.method`, `http.target`, and `http.status_code` attributes in the logs.

Then send the generated logs to the `otelcol.exporter.loki`'s input. 

**`otelcol.exporter.loki`** 

This component accepts OTLP-formatted logs from other otelcol components and converts them to Loki-formatted log entries without further configuration. 

Forward the Loki-formatted logs to the `loki.process "autologging"`'s receiver for further processing. 

**`loki.process`**

Use this component to:
  - Convert the body from JSON to logfmt using the `stage.json` and `stage.logfmt` stages
  - Add the `method`, `status`, and `target` labels from the `http.method`, `http.status_code`, and `http.target` attributes

<img width="917" alt="image" src="https://github.com/user-attachments/assets/10aaff15-6561-4c6a-b21b-9d1f2a2d5be5" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to Dashboards > `Section 7 Verification` and you should see a dashboard with panels containing the rate of spanlog ingestion as well as the spanlogs themselves.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/07cea252-4ba4-489b-957f-eaaeccb07418" />

### Mission 1

#### Description

One of our trusted informants has stashed an encrypted file—`secret_message.txt.enc`—on a remote dead-drop.

The decryption key? Hidden in plain sight, embedded in an internal label on the service discovery targets.
Since internal labels are stripped before metrics make it to Mimir, this covert tactic kept the key out of enemy hands.

Your mission: use Alloy to uncover the hidden key, decrypt the message, and reveal the intel within.

#### Objectives

- Use the Alloy UI to find the key hidden in the internal label on the service discovery targets
- Decode the key and decrypt the secret message

#### Instructions

Access the [Alloy UI](http://localhost:12347) and look for the hidden key on one of the service discovery targets.

To decrypt and print the AES-256-CBC encrypted secret message, run the following command in the terminal at the root of the lab repo directory, using the key you just found:
`openssl enc -aes-256-cbc -d -salt -pbkdf2 -in secret_message.txt.enc -k '<key>'`

#### Verification

You should see the secret message in the console!

### Mission 2

#### Description

A rogue actor has tampered with IMF's monitoring systems, slipping a high-cardinality instance_id label into a metric that counts database calls.

This unexpected spike in cardinality is putting Mimir under serious pressure -- and it's up to us to defuse the situation before it blows.

You can see the dashboard that informed the IMF that this was happening by navigating to [Dashboards](http://localhost:3000/dashboards) > `Mission 2`.

But it's not all bad news. Hidden within the instance_id is valuable intel: the name of the cloud provider.
IMF wants us to extract that information and promote it to a dedicated cloud_provider label—transforming this mess into a mission success.

IMF has equipped you with the following regex to help you complete this mission:
`^(aws|gcp|azure)-.+`

#### Objectives

- Using `prometheus.relabel`, use the provided regex to replace the `cloud_provider` label with the extracted value from the `instance_id` label.
- Drop the `instance_id` label.

#### Instructions

For this exercise, you may find the following components useful:

- [prometheus.relabel](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/)

Go back to the portion of config from Section 4, where we started scraping metrics from the mythical services. Paste the following in above the `prometheus.write.queue` component (**note**: the order of components does not matter, this is just for organization and readability):

```alloy
prometheus.relabel "mission_2" {
    forward_to = [prometheus.write.queue.experimental.receiver]

  //write a relabel rule to extract the cloud provider from the instance_id label and add it as a new label called cloud_provider
    rule {
        action        = // TODO: Fill this in
        target_label  = // TODO: Fill this in
        source_labels = // TODO: Fill this in
        regex         = "^(aws|gcp|azure)-.+"
        replacement   = "$1"
    }

    // drop the instance_id label from metrics
    rule {
        action  = // TODO: Fill this in
        regex   = // TODO: Fill this in
    }
}
```

#### Verification

Navigate to the [Explore](http://localhost:3000/explore) page and look at the metrics.
Query for `count(mythical_db_requests_count_total{cloud_provider!=""})` and you should see a non-zero value.

<img width="909" alt="image" src="https://github.com/user-attachments/assets/53a5e41c-9716-4294-a3fb-d946cc07acf9" />

### Mission 3

After much debate, the various departments within IMF have reached a rare consensus: it's time to standardize the attribute name for service tiers.
Until now, teams have been using conflicting keys like servicetier and service_tier, creating chaos in spanmetrics and cross-department dashboards.

Headquarters has spoken—service.tier is the new standard.

Your mission: use Alloy to bring order to the data.
Normalize the attribute across the board so that spanmetrics flow smoothly and dashboards speak a common language.

#### Objectives

- Use the [`otelcol.processor.attributes`](https://grafana.com/docs/agent/latest/flow/reference/components/otelcol.processor.attributes/) component to set the `service.tier` attribute to the value of
  the `servicetier` or `service_tier` attributes.
- Drop the `servicetier` and `service_tier` attributes.

#### Instructions

The [`otelcol.processor.attributes`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.attributes/) component allows you to add, set, or drop attributes.

Go back to the portion of config from Section 5, where we received traces from the mythical services. Paste the following  above the `otelcol.processor.batch.default` component (**note**: the order of components does not matter, this is just for organization and readability):

```alloy
otelcol.processor.attributes "mission_3" {
    // These two actions are used to add the service.tier attribute to spans from
    // either the servicetier or service_tier attributes.
    action {
        action         = "//TODO: Fill this in"
        key            = "//TODO: Fill this in"
        from_attribute = "//TODO: Fill this in"
    }
    action {
        action         = "//TODO: Fill this in"
        key            = "//TODO: Fill this in"
        from_attribute = "//TODO: Fill this in"
    }

    // This isn't required, but shows how to exclude the attributes we just copied.
    exclude {
        match_type = "strict"

        attribute {
            key = "//TODO: Fill this in"
        }

        attribute {
            key = "//TODO: Fill this in"
        }
    }

    output {
        traces = [otelcol.processor.batch.default.input]
    }
}
```

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Mission 3` and you should see a dashboard with data including the new `service_tier` attribute, which came from spanmetrics generation using the `service.tier` attribute we just consolidated.

<img width="909" alt="image" src="https://github.com/user-attachments/assets/db5b980b-83b1-4c92-9d19-b33e50a52530" />


### Mission 4

#### Description

The IMF needs your expertise for one final mission.
An opposing state actor exploited a Zero-Day vulnerability in one of our servers, causing sensitive tokens to be logged by the mythical-requester.

The security team is standing by, but before they can act, we need to make sure no tokens are being written to Loki.
Your task: use Alloy to identify and redact any sensitive tokens from the mythical-service logs—effectively, clean up the trail and keep things secure.

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Mission 4`. You will see logs coming in with sensitive token information. 

#### Objectives

- Redact any tokens found in the logs from the mythical services

#### Instructions

Take a look at the [`loki` components](https://grafana.com/docs/alloy/latest/reference/components/loki/). Are there any that seem like they could be useful for this mission?

Which section would you add this component to and how would you have to change the previous configuration? 

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Mission 4` and you should see a dashboard with a
panel showing the rate of logs with tokens coming from the mythical services as well as the logs themselves with the secret token redacted. 

<img width="913" alt="image" src="https://github.com/user-attachments/assets/02151116-d8c5-4aa1-844a-6c6d9a32285a" />

### Recap
<img width="912" alt="image" src="https://github.com/user-attachments/assets/e460c24b-44f1-4db7-b965-e9753174304c" />
<img width="910" alt="image" src="https://github.com/user-attachments/assets/23a73a88-49f5-4a05-b71a-7352a8ecc048" />
<img width="911" alt="image" src="https://github.com/user-attachments/assets/8b217a14-4b3a-4a54-a108-389d2676bffa" />

# Q & A
![Alt Text](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXU1ZnNwazRmbXdmcGMzZmNueWd3eTk4aWJlNmI0dHd6OXR5azh3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT5LMB2WiOdjpB7K4o/giphy.gif)

