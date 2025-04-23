# Building OpenTelemetry and Prometheus native telemetry pipelines with Grafana Alloy

<img width="917" alt="image" src="https://github.com/user-attachments/assets/9217f310-39c8-4baa-b748-0a19cc40a5ba" />
<img width="912" alt="image" src="https://github.com/user-attachments/assets/6cc578a3-2531-41e2-aecc-bd505fd39b49" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/7e6d7aa0-4af3-4e40-8bea-3753ad021227" />
<img width="908" alt="image" src="https://github.com/user-attachments/assets/72a0a2a4-02d8-422d-b634-d71645ac840f" />

## Resources for the workshop

- [Lab environment repo](https://github.com/spartan0x117/intro-to-mltp/tree/main)
  - [Endpoints used in the workshop](https://github.com/spartan0x117/intro-to-mltp/blob/main/alloy/endpoints.json)
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
<img width="947" alt="image" src="https://github.com/user-attachments/assets/5271fb3d-d5ae-4af0-9fee-7ffba4988293" />
<img width="948" alt="image" src="https://github.com/user-attachments/assets/c70b445b-c9a2-4a6f-96d3-dd3953877042" />
<img width="474" alt="image" src="https://github.com/user-attachments/assets/1a78778c-4583-4ed6-9e5c-4e5272dd26fb" />

These components could be put together in any way to form a complete set of instructions on how to collect, transform, and deliver telemetry data. This set of instructions is known as a `pipeline` in Alloy. 

### Each task/component could be further broken down into a detailed set of instructions.
These subtasks/subcomponents are known as `blocks` in Alloy. 

<img width="729" alt="image" src="https://github.com/user-attachments/assets/ed8aa651-f522-45ea-9556-de943f4908f9" />

<img width="949" alt="image" src="https://github.com/user-attachments/assets/67179581-8c0b-4ec6-8d9e-96256aeb1828" />

- prometheus.remote_write "default": A labeled block which instantiates a `prometheus.remote_write` component. The label is the string "default".
- endpoint: An unlabeled `block` inside the component that configures an endpoint to send metrics to.
  
<img width="936" alt="image" src="https://github.com/user-attachments/assets/92a0cf68-6299-4df6-8ed3-9c4e266fde55" />

- You use `expressions` to compute or denote the value of an `attribute`. The simplest `expressions` are constant values like strings, integers, lists, objects, etc.
- This block sets the url `attribute`  equal to the value (`expression`) of the url ("http://localhost:9009/api/prom/push").

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
We will be using the `config.alloy` file to build pipelines for Infrastructure O11y and Applications O11y. 
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
## Infrastructure O11y - collect, transform, and export logs and metrics
### Section 1: Collect and transform logs from Alloy
#### Objectives

- Collect logs from Alloy using the [`logging`](https://grafana.com/docs/alloy/latest/reference/config-blocks/logging/) block
- Use [`loki.relabel`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.relabel/) to add labels to the logs
- [Write](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/) the logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy/config.alloy
logging {
  format = "TODO: Fill in"
  level  = "TODO: Fill in"
  write_to = [TODO: Fill in]
}

loki.relabel "alloy_logs" {
   forward_to = [TODO: Fill in]

    rule {
        target_label = "TODO: Fill in"
        replacement = "TODO: Fill in"
    }

    rule {
        target_label = "TODO: Fill in"
        replacement = "TODO: Fill in" 
    }
}

loki.write "mythical" {
    endpoint {
       TODO: Fill in = "TODO: Fill in"
    } 
}
```

For the `logging` block, we want to set the log format to "logfmt" and the log level to "debug" and write the logs to the `loki.relabel.alloy_logs` component's receiver.

For the `loki.relabel` component, we want to set the `group` label to "infrastructure" and the `service` label to "alloy" and forward the logs to the `loki.write.mythical` component's receiver.

For the `loki.write` component, we want to ship logs to `http://loki:3100/loki/api/v1/push`.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/887f206b-683f-4107-aaf3-cb891c2226d1" />

Make sure to [reload the config](#reloading-the-config) after filling in the blocks!

#### Verification

Navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `Section 1 Verification` dashboard.

You should see the panels populated with data, showing the number of logs being sent by Alloy as well as the logs themselves.

**TODO: Add screenshot**

### Section 2: Collect and transform infrastructure metrics

#### Objectives

- Use [discovery.http](https://grafana.com/docs/alloy/latest/reference/components/discovery/discovery.http/) to discover the targets to scrape
- Scrape the targets' metrics using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to add labels to the metrics
- Use [`prometheus.remote_write`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/)to write the metrics to the locally running Mimir

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
discovery.http "service_discovery" {
    // TODO: Fill in this component
}

prometheus.scrape "infrastructure" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    // TODO: Fill in this component
}

prometheus.relabel "infrastructure" {
    // TODO: Fill in this component
}

prometheus.remote_write "mimir" {
    // TODO: Fill in this component
}
```

For this section, we want to discover the targets to scrape using the `discovery.http` component and scrape the targets' metrics using the `prometheus.scrape` component.

`discovery.http` is a component that polls a given URL for targets to scrape in JSON format. These targets are then exported for other components to use. In our demo environment,
we have a service that exposes the targets to scrape in the `http://service-discovery/targets.json` endpoint. These targets look something like:

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

In the `prometheus.relabel` component, we want to add the `group` label with the value of "infrastructure". The service discovery service already exposes targets with the `service` label set
to the right value, so we don't have to add any more labels.

Configure the `prometheus.remote_write` component to write the metrics to a local Mimir database. 

<img width="913" alt="image" src="https://github.com/user-attachments/assets/0b1627de-e289-4d8f-8bf0-f836d18afc9e" />


Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `Section 2 Verification` dashboard.

You should see an `up` value of 1 for the Loki, Mimir, Tempo, and Pyroscope services.

**TODO: Add screenshot**

### Section 3: Collect and transfrom metrics from Postgres DB

#### Objectives

- Collect metrics from Postgres using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to 
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

    targets    =  //To do: fill in
    forward_to =  //To do: fill in
}

prometheus.relabel "postgres" {
    forward_to =  //To do: fill in

    rule {
        target_label = //To do: fill in
        replacement  = //To do: fill in
    }
    
    rule {
        target_label = //To do: fill in
        replacement  = //To do: fill in
    }

 //What we have: postgres_table_rows_count{instance="postgresql://mythical-database:5432/postgres"}
 //What we want: postgres_table_rows_count{instance="mythical-database:5432/postgres"}
    
    rule {
        // Replace the targeted label.
        action        = //To do: fill in

        // The label we want to replace is 'instance'.
        target_label  = //To do: fill in

        // Look in the existing 'instance' label for a value that matches the regex.
        source_labels = //To do: fill in
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

**TODO: Add screenshot**

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

    // TO DO: Fill in the rest of this component
}

prometheus.write.queue "experimental" {
    endpoint "mimir" {
        // TO DO: Fill in the argument
    }
}

```
For the `prometheus.scrape` component, we can define scrape targets for mythical services directly by creating a scrape object. Scrape targets are defined as a list of maps, where each map contains a `__address__` key with the address of the target to scrape. Any non-double-underscore keys are used as labels for the target.

For example, the following scrape object will scrape Mimir's metrics endpoint and add `env="demo"` and `service="mimir"` labels to the target:

```alloy
targets = [{"__address__" = "mimir:9009",  env = "demo", service = "mimir"}]
```

The addresses of the targets are:

- mythical-server: "mythical-server:4000"
- mythical-requester: "mythical-requester:4001"

Forward the metrics to the `prometheus.write.queue` component we will define next. 

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to Dashboards > `Section 4 Verification` and you should see a panel with the request rate per beast flowing!

**TODO: Add screenshot**

![Alt Text](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExODN2dXRwNXo3dHl1enMyaXRqMjJjbTUxMGZmNnRldDJxcTJmdDB2OCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UWF3nQFeXR30yjna2Q/giphy.gif)

### Section 5: Ingesting OTel traces

#### Objectives

- [Receive](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/) spans from the Mythical services and Beyla
- [Batch spans](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.batch/) for efficient processing
- [Write](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlp/) the spans to a local instance of Tempo

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
otelcol.receiver.otlp "otlp_receiver" {
    // TODO: Fill this component in
    output {
        traces = [
            // TODO: Fill this in
        ]
    }
}

otelcol.processor.batch "default" {
    // TODO: Fill this in
}

otelcol.exporter.otlp "tempo" {
    // TODO: Fill this in
    client {
        // TODO: Fill this in

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

**TODO: Add screenshot**

You can also navigate to [Dashboards](http://localhost:3000/dashboards) > `MLT Dashboard`. These dashboards are configured to use the metrics
from Spanmetrics, so you should see data for the spans we're ingesting.

<img width="1434" alt="image" src="https://github.com/user-attachments/assets/73080e3d-5dc3-4013-9409-09cd9887d565" />

### Section 6: Ingesting application logs

<img width="915" alt="image" src="https://github.com/user-attachments/assets/f5f2384a-35b4-4796-89a5-d3a0f2598327" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/8b8afaa5-ade1-4c5a-9935-6ccb607af0f9" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/4bbea9f2-28a4-4cb4-9a5b-fabe4e848fc6" />

#### Objectives

- Ingest application logs sent from the mythical services
- Process the logs to:
  - add a static `service="mythical" label
  - extract the timestamp from the log line using `stage.regex` with this regex: `^.*?loggedtime=(?P<loggedtime>\S+)`
  - set the timestamp of the log to the extracted timestamp
- Forward the processed logs to Loki

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
loki.source.api "mythical" {
    // TODO: Fill this in
}

loki.process "mythical" {
    // TODO: Fill this in
}
```

#### Verification

Navigate to Dashboards > `Section 6 Verification` and you should see a dashboard with the rate of logs coming from the mythical apps as well as panels showing the logs themselves for the server and requester

**TODO: Add screenshot**

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
    // TODO: Fill this in
}

otelcol.exporter.loki "autologging" {
    // TODO: Fill this in
}

// The Loki processor allows us to accept a Loki-formatted log entry and mutate it into
// a set of fields for output.
loki.process "autologging" {
    stage.json {
        // TODO: Fill this in
    }

    stage.output {
        // TODO: Fill this in
    }

    stage.logfmt {
        // TODO: Fill this in
    }

    stage.labels {
        // TODO: Fill this in
    }

    forward_to = [loki.write.mythical.receiver]
}
```
**`otelcol.connector.spanlogs`**

For the `otelcol.connector.spanlogs` component to work, we will need to forward the spans from the `otelcol.receiver.otlp`'s output > traces we have defined in exercise 5 to the `otelcol.connector.spanlogs`'s input.

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

<img width="913" alt="image" src="https://github.com/user-attachments/assets/56125b64-effd-4965-9c41-9b27b9cbb21c" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

#### Verification

Navigate to Dashboards > `Section 7 Verification` and you should see a dashboard with panels containing the rate of spanlog ingestion as well as the spanlogs themselves.

**TODO: Add screenshot**

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

To decrypt and print the AES-256-CBC encrypted secret message, use `openssl enc -aes-256-cbc -d -salt -pbkdf2 -in secret_message.txt.enc -k '<key>'`,
using the key you just found.

#### Verification

You should see the secret message in the console!

### Mission 2

#### Description

A rogue actor has tampered with IMF's monitoring systems, slipping a high-cardinality instance_id label into a metric that counts database calls.
This unexpected spike in cardinality is putting Mimir under serious pressure -- and it's up to us to defuse the situation before it blows.

But it's not all bad news. Hidden within the instance_id is valuable intel: the name of the cloud provider.
IMF wants us to extract that information and promote it to a dedicated cloud_provider label—transforming this mess into a mission success.

IMF has equipped you with the following regex to help you complete this mission:
`^(aws|gcp|azure)-.+`

You can see the dashboard that informed the IMF that this was happening by navigating to [Dashboards](http://localhost:3000/dashboards) > `Mission 2`.

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
        action        = // TO DO: Fill in the argument
        target_label  = // TO DO: Fill in the argument
        source_labels = // TO DO: Fill in the argument
        regex         = "^(aws|gcp|azure)-.+"
        replacement   = "$1"
    }

    // drop the instance_id label from metrics
    rule {
        action  = // TO DO: Fill in the argument
        regex   = // TO DO: Fill in the argument
    }
}
```

#### Verification

Navigate to the [Explore](http://localhost:3000/explore) page and look at the metrics.
Query for `count(mythical_db_requests_count_total{cloud_provider!=""})` and you should see a non-zero value.

**TODO: Add screenshot**

### Mission 3

After much debate, the various departments within IMF have reached a rare consensus: it's time to standardize the attribute name for service tiers.
Until now, teams have been using conflicting keys like servicetier and service_tier, creating chaos in spanmetrics and cross-department dashboards.

Headquarters has spoken—service.tier is the new standard.

Your mission: use Alloy to bring order to the data.
Normalize the attribute across the board so that spanmetrics flow smoothly and dashboards speak a common language.

#### Objectives

- Use the `otelcol.processor.attributes` component to set the `service.tier` attribute to the value of
  the `servicetier` or `service_tier` attributes.
- Drop the `servicetier` and `service_tier` attributes.

#### Instructions

The [`otelcol.processor.attributes`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.attributes/) component allows you to add, set, or drop attributes.

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Mission 3` and you should see a dashboard with data including the new `service_tier` attribute,
which came from spanmetrics generation using the `service.tier` attribute we just consolidated.

**TODO: Add screenshot**

### Mission 4

#### Description

The IMF needs your expertise for one final mission.
An opposing state actor exploited a Zero-Day vulnerability in one of our servers, causing sensitive tokens to be logged by the mythical-requester.

The security team is standing by, but before they can act, we need to make sure no tokens are being written to Loki.
Your task: use Alloy to identify and redact any sensitive tokens from the mythical-service logs—effectively, clean up the trail and keep things secure.

You can see the logs by navigating to [Dashboards](http://localhost:3000/dashboards) > `Mission 4`.

#### Objectives

- Redact any tokens found in the logs from the mythical services

#### Instructions

Take a look at the `loki` components. Are there any that seem like they could be useful for this mission?

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Mission 4` and you should see a dashboard with a
panel showing the rate of logs with tokens coming from the mythical services as well as the logs themselves.

**TODO: Add screenshot**    

### Recap
<img width="1425" alt="image" src="https://github.com/user-attachments/assets/605eae50-3414-4e4d-9f62-11b6478c8d01" />
<img width="1437" alt="image" src="https://github.com/user-attachments/assets/669c122f-8337-4569-b4a5-6138dbb12ca9" />

# Debugging
<img width="909" alt="image" src="https://github.com/user-attachments/assets/8f97d371-d234-48be-b948-1577cdb0f0e7" />

# Q & A
![Alt Text](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXU1ZnNwazRmbXdmcGMzZmNueWd3eTk4aWJlNmI0dHd6OXR5azh3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT5LMB2WiOdjpB7K4o/giphy.gif)

