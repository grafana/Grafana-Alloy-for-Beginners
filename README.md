<img width="1874" height="1055" alt="image" src="https://github.com/user-attachments/assets/aaa6863c-967f-43fd-bd0c-538138d4fdc7" />
[![Video](https://img.youtube.com/vi/KWWI0WONPVE/maxresdefault.jpg)](https://www.youtube.com/watch?v=KWWI0WONPVE)
<img width="1873" height="1051" alt="image" src="https://github.com/user-attachments/assets/e3dd0e99-f78e-4767-9fda-d3e44daf9e1e" />
<img width="1872" height="1052" alt="image" src="https://github.com/user-attachments/assets/68c41817-7f5b-4247-a23f-bdab60df8dcf" />
<img width="1875" height="1055" alt="image" src="https://github.com/user-attachments/assets/10ed5e8d-fe6b-4529-ab14-4667012800ec" />
<img width="1874" height="1053" alt="image" src="https://github.com/user-attachments/assets/9ba26adc-1ab3-4598-9fdb-ce61aafef952" />
<img width="1872" height="1053" alt="image" src="https://github.com/user-attachments/assets/722500e5-d485-411f-841e-32d729dd0d0b" />

# Resources 
- [Grafana Alloy for Beginners YouTube Playlist](https://www.youtube.com/playlist?list=PLDGkOdUX1UjoUmd6Z-lKgGaGzmZvYxRWs)
- [Grafana Alloy documentation](https://grafana.com/docs/alloy/latest/)
  - [Alloy configuration blocks](https://grafana.com/docs/alloy/latest/reference/config-blocks/)
  - [Alloy components](https://grafana.com/docs/alloy/latest/reference/components/)
  - [Collect and forward data with Grafana Alloy](https://grafana.com/docs/alloy/latest/collect/)
  - [Grafana Alloy Tutorials](https://grafana.com/docs/alloy/latest/tutorials/)
- For **solutions to hands on exercises**, check out the branches of this repo
- The learning environment was based off of [grafana/intro-to-mltp](https://github.com/grafana/intro-to-mltp). 
  - This repo is a great resource for learning about the Grafana stack end to end, so check it out if you'd like a full end-to-end working example!
    
# What is Alloy? When does it make sense to use it? 
<img width="1873" height="1052" alt="image" src="https://github.com/user-attachments/assets/2c5b4c90-e4cb-492f-814d-9a797cd710dd" />
<img width="1872" height="1051" alt="image" src="https://github.com/user-attachments/assets/f0f919f3-b68b-4847-902d-b3b9c1f48a02" />
<img width="1871" height="1050" alt="image" src="https://github.com/user-attachments/assets/57e43ff8-5f3e-4dae-aaa0-5cef3b49645d" />
<img width="1873" height="1055" alt="image" src="https://github.com/user-attachments/assets/ec8c5f44-57cd-45aa-a70b-ba9de37a34fe" />
<img width="1872" height="1052" alt="image" src="https://github.com/user-attachments/assets/b8a046b7-ce48-4837-acd4-ee4149e493c6" />
<img width="1872" height="1051" alt="image" src="https://github.com/user-attachments/assets/fb39f801-a990-4924-b0e6-1f11572ffa29" />

# Alloy configuration language 101

### Think of Alloy as our trusty pal who can collect, process, and export our telemetry data. 

![Alt Text](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2kweW0xMzU5bzQ3ZHUxZDdnbHFid3I0NGoyd3I2am11eHRoYnRsNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xTiTnuhyBF54B852nK/giphy.gif)

To instruct Alloy on how we want that done, we must write these instructions in a language (`Alloy syntax`) that Alloy understands. 

<img width="1876" height="1052" alt="image" src="https://github.com/user-attachments/assets/451e990c-36a1-47f4-829f-d5c4bb1e7708" />
<img width="1874" height="1051" alt="image" src="https://github.com/user-attachments/assets/e8675a8f-057d-4f15-aeb5-9bd2a333749a" />
<img width="1872" height="1049" alt="image" src="https://github.com/user-attachments/assets/bf15e800-5dbf-4fe8-a467-3446365243c4" />
<img width="1873" height="1053" alt="image" src="https://github.com/user-attachments/assets/44e33cfd-09ff-4363-b972-7a4c4778ec49" />
<img width="1873" height="1052" alt="image" src="https://github.com/user-attachments/assets/b326bc81-bc3f-4895-b50b-7728a75b1ee4" />
<img width="1877" height="1055" alt="image" src="https://github.com/user-attachments/assets/6291f81b-9205-4ad1-b443-e1ee8f1e16a0" />
<img width="1875" height="1055" alt="image" src="https://github.com/user-attachments/assets/acfd967b-800e-4be7-ad9d-f931c41ef451" />
<img width="1872" height="1053" alt="image" src="https://github.com/user-attachments/assets/29fdef87-2f43-49dc-879e-f299ea710c09" />
<img width="1876" height="1054" alt="image" src="https://github.com/user-attachments/assets/344884c6-2fce-427a-b5c5-c633b0ae0a8c" />
<img width="1873" height="1053" alt="image" src="https://github.com/user-attachments/assets/4452dd7e-c5d9-4963-8db9-2e0f301a0cbe" />
<img width="1874" height="1052" alt="image" src="https://github.com/user-attachments/assets/c72f8819-68c5-46a2-866c-687489e75e2c" />
<img width="1873" height="1054" alt="image" src="https://github.com/user-attachments/assets/5b4e0e98-c880-48bd-ac43-1aed2f3c6415" />

The `usage` section gives you an example of how this particular component could be configured. 

<img width="1872" height="1051" alt="image" src="https://github.com/user-attachments/assets/2df884bc-ae97-4d65-975b-95e2904013b9" />

The `arguments` and `blocks` sections list what you could do with the data. Pay close attention to the name, type, description, default, and required columns so Alloy could understand what you want it to do! 

<img width="1873" height="1053" alt="image" src="https://github.com/user-attachments/assets/08888cf8-68cb-48d3-a51b-ed4ca89b1430" />
<img width="1874" height="1052" alt="image" src="https://github.com/user-attachments/assets/2593ceff-7b48-400b-8968-d7c1ee60594d" />

Focusing on these 3 things will point us in the right direction as we configure our pipeline. 
<img width="1875" height="1052" alt="image" src="https://github.com/user-attachments/assets/46edeeee-502c-4002-8a3b-b69b74979de6" />

# Learning environment setup

<img width="1872" height="1050" alt="image" src="https://github.com/user-attachments/assets/2645a894-9e08-43e5-804c-ce01753d1ca7" />

Before getting started, make sure you:
- install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and [Docker Compose](https://docs.docker.com/compose/install/)
  
- clone the repo for the learning environment :
```
git clone https://github.com/grafana/Grafana-Alloy-for-Beginners.git
```

To start the environment, run the following command from within the project's root directory:
```
make run
```

To stop the environment, run the following command from within the project's root directory:
```
make stop
```

Open the project using a text editor of your choice.
- Expand the alloy folder and open the `config.alloy` file.
- We will be using this file to build pipelines for Infrastructure Observability and Applications Observability. 

# Infrastructure Observability
## Collect, process, and export infrastructure logs and metrics
### Section 1: Build a pipeline for infrastructure logs with Alloy
#### Objectives
- Collect logs from Alloy using the [`logging`](https://grafana.com/docs/alloy/latest/reference/config-blocks/logging/) block
- Use [`loki.relabel`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.relabel/) to add labels to the logs
- Use [`loki.write`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/) to export logs to Loki

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
#### Tasks

`logging` block:
- set the log format to "logfmt"
- set the log level to "debug"
- send the logs to the receiver of the`loki.relabel.alloy_logs` component

`loki.relabel` component:
- Use the `rule` block to
  - set the `group` label to "infrastructure"
  - set the `service` label to "alloy"
  - **Note**: These rules are applied in the order they are written!
- forward the logs to the receiver of the `loki.write.mythical` component

`loki.write` component:
- export the logs to a locally running Loki database ("http://loki:3100/loki/api/v1/push")

<img width="1874" height="1053" alt="image" src="https://github.com/user-attachments/assets/649fe505-e3a6-4a74-b998-f00975f9d040" />

<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 1
logging {
    format = "logfmt"
    level  = "debug"

    write_to = [loki.relabel.alloy_logs.receiver]
}

loki.relabel "alloy_logs" {
    forward_to = [loki.write.mythical.receiver]

    rule {
        target_label = "group"
        replacement  = "infrastructure"
    }

    rule {
        target_label = "service"
        replacement  = "alloy" 
    }
}

loki.write "mythical" {
    endpoint {
        url = "http://loki:3100/loki/api/v1/push"
    } 
}
```

</details>

#### Reloading the config

Whenever we make changes to the file, we must reload the config. 

To reload Alloy's config, hit the following endpoint in a browser or with a tool like `curl`:

```bash
curl -X POST http://localhost:12345/-/reload
```

If the config is valid, we should see a response like the following:

```
config reloaded
```

#### Verification

Navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `Section 1 Verification` dashboard.

You should see the panels populated with data, showing the number of logs being sent by Alloy as well as the logs themselves.

<img width="911" alt="image" src="https://github.com/user-attachments/assets/07d04e94-caa5-4316-92dc-a50ebfdb333a" />

Expand a log line to view its labels. 

You should see labels "group = infrastructure" and "service = alloy".

### Section 2: Build a pipeline for infrastructure metrics with Alloy - Part I

#### Objectives

- Use the [`discovery.http`](https://grafana.com/docs/alloy/latest/reference/components/discovery/discovery.http/) component to discover the targets to scrape
- Scrape the targets' metrics using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use the [`prometheus.remote_write`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) component to export metrics to the locally running Mimir

In this section, we will learn how to perform service discovery using Alloy. (`discovery.http`). 

When we’re monitoring infrastructure or applications, we’re often working in dynamic environments where things are constantly changing.
<img width="907" alt="image" src="https://github.com/user-attachments/assets/f420f7c3-87c6-40c6-9be4-d594aa498338" />

There could be 1000 servers or containers starting and stopping whose names and addresses are constantly changing.
<img width="908" alt="image" src="https://github.com/user-attachments/assets/fe1aae3a-4552-4c1a-8c34-6d05e18b1be6" />

We want to avoid keeping up with ever changing list of sources that we need to collect telemetry from. 

Instead of hard coding all the names and addresses of all the telemetry sources, what if there was a system that automatically tracked all the telemetry sources in our environment and Alloy could query it to discover what to collect from?

That’s exactly what service discovery components do. They are configured to query systems like the Kubernetes API or AWS EC2, which already track your infrastructure. Then they retrieve and format the list of discovered targets, exposing them to other Alloy components to collect telemetry from.


#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
//Section 2
discovery.http "service_discovery" {
    url = "//TODO: Fill this in"
    refresh_interval = "2s"
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
#### Tasks

`discovery.http` component:
- Ping an HTTP within our lab environment in charge of finding targets("http://service-discovery/targets.json")
  - this http endpoint is aware of all instances of Loki, Tempo, Mimir, and Pyroscope databases that are currently running within our environment
- Set the `refresh_interval` argument to 2 seconds for demo purposes 

`prometheus.scrape` component:
- Set the scrape interval and scrape timeout to 2 seconds
- Scrape `discovery.http.service_discovery` component's target
- Forward the metrics to `prometheus.remote_write.mimir` component's receiver

`prometheus.remote_write` component:
- Export metrics to a local Mimir database ("http://mimir:9009/api/v1/push")

<img width="1873" height="1052" alt="image" src="https://github.com/user-attachments/assets/43ac7e4e-0389-4624-a502-c57ec079dc6c" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 2
discovery.http "service_discovery" {
    url              = "http://service-discovery/targets.json" 
    refresh_interval = "2s"
}

prometheus.scrape "infrastructure" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets    = discovery.http.service_discovery.targets
    forward_to = [prometheus.remote_write.mimir.receiver]
}

prometheus.remote_write "mimir" {
    endpoint {
        url = "http://mimir:9009/api/v1/push"
    }
}
```

</details>

#### Verification

Navigate to the [Dashboards](http://localhost:3000/dashboards) page and select the `Section 2 Verification` dashboard.

You should see an `up` value of 1 for the Loki, Mimir, Tempo, and Pyroscope services.

If we see a 0, that indicates there has been an error somewhere.

<img width="911" alt="image" src="https://github.com/user-attachments/assets/a7f7d7f8-e0d8-4cc2-b76a-c0d03e55d8d5" />

### Section 3: Build a pipeline for infrastructure metrics with Alloy - Part II

#### Objectives

- Expose metrics from the Postgres DB using the [`prometheus.exporter.postgres`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.exporter.postgres/) component
- Scrape metrics from Postgres using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Use the [`prometheus.relabel`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.relabel/) to add and modify labels
- Export metrics to Mimir using the [`prometheus.remote_write`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) component

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
//Section 3
prometheus.exporter.postgres "mythical" {
    data_source_names = ["postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable"]
}

prometheus.scrape "postgres" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets    =  //TODO: Fill this in
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

 //What we have: {instance="postgresql://mythical-database:5432/postgres"}
 //What we want: {instance="mythical-database:5432/postgres"}
    
    rule {
        // Replace a label's value.
        action        = "//TODO: Fill this in"

        // The label we want to replace is 'instance'.
        target_label  = "//TODO: Fill this in"

        // Look in the existing 'instance' label for anything starting with postgresql:// and capture what follows.
        source_labels = ["//TODO: Fill this in"]
        regex         = "^postgresql://(.+)"
        
        // Replace the value with just the captured part, leaving out the prefix.
        replacement   = "$1"
    }
}
```
#### Tasks

`prometheus.exporter.postgres` component:
- Specify the url of a local Postgres database to connect to and expose metrics for a Postgres database ("postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable")

`prometheus.scrape` component:
-  Scrape the `prometheus.exporter.postgres.mythical` component's targets
-  Forward the metrics to the `prometheus.relabel.postgres` component's receiver

`prometheus.relabel` component:
- Add the `group="infrastructure"` and `service="postgres"` labels to the metrics
- Modify the `instance` label to clean it up
  - Before: `postgresql://mythical-database:5432/postgres`
  - After: `mythical-database:5432/postgres`

<img width="1873" height="1050" alt="image" src="https://github.com/user-attachments/assets/6bd9119e-ceaa-42c8-9d27-250e64f095c1" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 3
prometheus.exporter.postgres "mythical" {
    data_source_names = ["postgresql://postgres:mythical@mythical-database:5432/postgres?sslmode=disable"]
}

prometheus.scrape "postgres" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets    =  prometheus.exporter.postgres.mythical.targets
    forward_to =  [prometheus.relabel.postgres.receiver]
}

prometheus.relabel "postgres" {
    forward_to =  [prometheus.remote_write.mimir.receiver]

    rule {
        target_label = "group"
        replacement  = "infrastructure"
    }

    rule {
        target_label = "service"
        replacement  = "postgres"
    }

     rule {
        // Replace a label's value.
        action        = "replace"

        // The label we want to replace is 'instance'.
        target_label  = "instance"

        // Look in the existing 'instance' label for anything starting with postgresql:// and capture what follows.
         source_labels = ["instance"]
        regex         = "^postgresql://(.+)"
        
        // Replace the value with just the captured part, leaving out the prefix.
        replacement   = "$1"
    }
}
```

</details>

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) and select `Section 3 Verification`.
We should see a dashboard populating with Postgres metrics. 

We should also see an instance value of `mythical-database:5432/postgres` instead of `postgresql://mythical-database:5432/postgres`.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/5907b198-b732-4b7d-a0a5-65dcf47f7e4c" />

### How to use the Alloy UI to debug pipelines

Alloy UI is a useful tool that helps you visualize how Alloy is configured and what it is doing so you are able to debug efficiently. 

Navigate to `localhost:12347` to see the list of components (orange box) that alloy is currently configured with.
Click on the blue ‘view’ button on the right side (red arrow).
<img width="1874" height="1055" alt="image" src="https://github.com/user-attachments/assets/96be0cde-1e05-4e4b-b619-98fc44e4c063" />

This page shows us the health of the component, the arguments it's using, and its current exports (green box). 

This page also gives us quick access to the component’s documentation (orange arrow) and a Live Debugging view (yellow arrow). 
<img width="1874" height="1054" alt="image" src="https://github.com/user-attachments/assets/097eaa44-b346-4c29-badd-44cc90652b9e" />

When we click on the Live Debugging view, we will be able to see a real-time stream of telemetry flowing through a component.
<img width="1872" height="1053" alt="image" src="https://github.com/user-attachments/assets/55491d17-5cf7-48fb-9311-34057e84b3f9" />

Navigate to the ‘Graph’ tab (blue arrow) to access the graph of components and how they are connected.
<img width="1873" height="1053" alt="image" src="https://github.com/user-attachments/assets/d9996c31-4c1a-4ca3-8ec4-57ec19c4b10a" />

The number (pink box) shown on the dotted lines shows the rate of transfer between components. The window at the top (orange box) configures the interval over which alloy should calculate the per-second rate, so a window of ‘10’ means that alloy should look over the last 10 seconds to compute the rate.

The color of the dotted line signifies what type of data are being transferred between components. See the color key (purple box) for clarification. 

Navigate to the `Clustering` tab (blue arrow) to view the instances of Alloy. 

<img width="1875" height="1054" alt="image" src="https://github.com/user-attachments/assets/bf8e300a-122a-4602-b250-d28bb4b78673" />

A `cluster node` is an instance of Alloy that participates in workload distribution and ensures high availability.

The Clustering page in the Alloy UI shows the status and role of each node, so you can easily monitor which nodes are active, their addresses, and its current state.

**To debug the piplines using the Alloy UI**
- Ensure that no component is reported as unhealthy.
- Ensure that the arguments and exports for misbehaving components appear correct.
- Ensure that the live debugging data meets your expectations.

# Application Observability 
## Collect, transform, and export application metrics, traces, and logs
### Section 4: Build a pipeline for application metrics with Alloy

#### Objectives

- Collect application metrics using the [`prometheus.scrape`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.scrape/) component
- Export metrics to locally running Mimir using the [`prometheus.write.queue`](https://grafana.com/docs/alloy/latest/reference/components/prometheus/prometheus.remote_write/) component

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
//Section 4
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
        url = "//TODO: Fill this in"
    }
}

```

#### Tasks
`prometheus.scrape` component:
- Define scrape targets for mythical services directly by creating a scrape object.
  - Scrape targets are defined as a list of maps, where each map contains a `__address__` key with the address of the target to scrape. 
  - Any non-double-underscore keys are used as labels for the target.
    - For example, the following scrape object will scrape Mimir's metrics endpoint and add `env="demo"` and `service="mimir"` labels to the target:
      
```alloy
targets = [{"__address__" = "mimir:9009",  env = "demo", service = "mimir"}]
```
- create two targets using the following addresses. 
  - "mythical-server:4000"
  - "mythical-requester:4001"
- Add the following labels for each target. 
  - mythical-server:
   - group = "mythical", service = "mythical-server"
  - mythical-requester:
    - group = "mythical", service = "mythical-requester"
- Forward the metrics to the `prometheus.write.queue` component we will define next. 

`prometheus.write.queue` component:
- Set the `url` equal the address of the locally running Mimir ("http://mimir:9009/api/v1/push")

<img width="1872" height="1054" alt="image" src="https://github.com/user-attachments/assets/5d289b5b-acbc-40eb-8038-69ee4d7d47e3" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 4
prometheus.scrape "mythical" {
    scrape_interval = "2s"
    scrape_timeout  = "2s"

    targets = [
        {"__address__" = "mythical-server:4000", group = "mythical", service = "mythical-server"},
        {"__address__" = "mythical-requester:4001", group = "mythical", service = "mythical-requester"}, 
    ]

    forward_to = [prometheus.write.queue.experimental.receiver]
}

prometheus.write.queue "experimental" {
    endpoint "mimir" {
        url = "http://mimir:9009/api/v1/push"
    }
}
```

</details>

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Section 4 Verification` and we should see a panel with the request rate per beast flowing!

<img width="909" alt="image" src="https://github.com/user-attachments/assets/e3271544-b277-4114-a969-733ce4da064b" />

### Section 5: Build a pipeline for application traces with Alloy

#### Objectives

- Receive spans using the [`otelcol.receiver.otlp`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/) component
- Batch spans using the [`otelcol.processor.batch`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.batch/) component
- Export spans using the [`otelcol.exporter.otlp`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.otlp/) component

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
//Section 5
otelcol.receiver.otlp "otlp_receiver" {
    grpc {
        endpoint = "//TODO: Fill in the default value shown in the grpc block section of the otelcol.receiver.otlp doc"
    }
    http {
        endpoint = "//TODO: Fill in the default value shown in the http block section of the otelcol.receiver.otlp doc"
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
`otelcol.receiver.otlp` component:
- Open the doc for the [`otelcol.receiver.otlp`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/) component
- Find the default port for grpc and set its endpoint equal to it
- Find the default port for http and set its endpoint equal to it
- Using the `output` block, send the traces to the input of the `otelcol.processor.batch` component we will define next 

`otecol.processor.batch` component:
- The batch processor will batch spans until a batch size or a timeout is met, before sending those batches on to another component
- Configure it to batch minimum 1000 spans, up to 2000 spans, or until 2 seconds have elapsed
- Using the `output` block, send the batched traces to the input of the `otelcol.exporter.otlp` component we will define next

`otelcol.exporter.otlp` component: 
- Using the `client` block, export batches of spans to a local instance of Tempo
- The Tempo url is "http://tempo:4317"

<img width="1874" height="1054" alt="image" src="https://github.com/user-attachments/assets/f673aa97-192c-466a-8775-00bcf2d7d652" />

Don't forget to [reload the config](#reloading-the-config) after finishing.

<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 5
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
    output {
        traces = [
            otelcol.exporter.otlp.tempo.input,
        ]
    }

    send_batch_size     = 1000
    send_batch_max_size = 2000

    timeout = "2s"
}

otelcol.exporter.otlp "tempo" {
    client {
        endpoint = "http://tempo:4317"

        // This is a local instance of Tempo, so we can skip TLS verification
        tls {
            insecure             = true
            insecure_skip_verify = true
        }
    }
}
```

</details>

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Section 5 Verification` and you should see a dashboard with a populated service graph, table of traces coming from the mythical-requester, and the rate of span ingestion by Tempo

<img width="917" alt="image" src="https://github.com/user-attachments/assets/564236f6-e3b5-430c-a963-2f7509960e5c" />

You can also navigate to [Dashboards](http://localhost:3000/dashboards) > `MLT Dashboard`. These dashboards are configured to use the metrics from Spanmetrics, so you should see data for the spans we're ingesting.

<img width="914" alt="image" src="https://github.com/user-attachments/assets/d0822e32-0af2-4f13-b6de-2c037d2e8a93" />

### Section 6: Build a pipeline for application logs with Alloy
#### Objectives

- Ingest application logs using the [`loki.source.api`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.source.api/) component
- Add labels to logs using the [`loki.process`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/) component
- [Use](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/) `stage.regex` and `stage.timestamp` to extract the timestamp from the log lines and set the log’s timestamp

<img width="1874" height="1055" alt="image" src="https://github.com/user-attachments/assets/5234c304-1357-4263-89b4-5d8134f1025e" />
<img width="913" alt="image" src="https://github.com/user-attachments/assets/8b8afaa5-ade1-4c5a-9935-6ccb607af0f9" />

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
//Section 6
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
#### Tasks
`loki.source.api` component:
- Ingest application logs sent from the mythical services 

`loki.process` component:
  - add a static `service="mythical" label
  - extract the timestamp from the log line using `stage.regex` with this regex: `^.*?loggedtime=(?P<loggedtime>\S+)`
  - set the timestamp of the log to the extracted timestamp
  - Forward the processed logs to Loki

Don't forget to [reload the config](#reloading-the-config) after finishing.

<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 6
loki.source.api "mythical" {
    http {
        listen_address = "0.0.0.0"
        listen_port    = "3100"
    }
    forward_to = [loki.process.mythical.receiver]
}

loki.process "mythical" {
    stage.static_labels {
        values = {
           service = "mythical",
        }
    }
    stage.regex {
            expression=`^.*?loggedtime=(?P<loggedtime>\S+)`
    }

    stage.timestamp {
        source = "loggedtime"
        format = "2006-01-02T15:04:05.000Z07:00"
    }

    forward_to = [loki.write.mythical.receiver]
}
```

</details>

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Section 6 Verification` and you should see a dashboard with the rate of logs coming from the mythical apps as well as panels showing the logs themselves for the server and requester

<img width="913" alt="image" src="https://github.com/user-attachments/assets/01b5718b-aa1c-47d6-92a1-206aca81066c" />

### Section 7: Generate logs from application traces with Alloy

#### Objectives

- Recieve OTLP spans from app using the [`otelcol.receiver.otlp`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.receiver.otlp/) component
- Convert ingested traces to logs using the [`otelcol.connector.spanlogs`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.connector.spanlogs/) component 
- Convert the logs to Loki formatted log entries using the [`otelcol.exporter.loki`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.exporter.loki/) component
- Use the [`loki.process`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.process/) component to convert the format and add attributes to the logs
- Export processed logs to Loki using the [`loki.write`](https://grafana.com/docs/alloy/latest/reference/components/loki/loki.write/) component

#### Instructions

Open `config.alloy` in your editor and copy the following code into it:

```alloy
//Section 7
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
#### Tasks
`otelcol.connector.spanlogs` component:

- Forward the spans from the `otelcol.receiver.otlp`'s output > traces we have defined in section 5 to the `otelcol.connector.spanlogs`'s input.
- Generate a log for each full trace(root), not for each span or process 
- Include the `http.method`,`http.status_code`, `http.target` attributes in the logs.
- Send the generated logs to the `otelcol.exporter.loki`'s input. 

`otelcol.exporter.loki` component:

- This component accepts OTLP-formatted logs from other otelcol components and converts them to Loki-formatted log entries without further configuration. 
- Forward the Loki-formatted logs to the `loki.process "autologging"`'s receiver for further processing. 

`loki.process` component: 
- Convert the body from JSON to logfmt using the `stage.json` and `stage.logfmt` stages
- Add the `method`, `status`, and `target` labels from the `http.method`, `http.status_code`, and `http.target` attributes

<img width="1875" height="1053" alt="image" src="https://github.com/user-attachments/assets/b233bfc7-7b36-4137-913d-82e37bea4617" />

Don't forget to [reload the config](#reloading-the-config) after finishing.
    
<details>
  <summary><h4>Expand to see the solution</h4></summary>

```alloy
//Section 7
otelcol.connector.spanlogs "autologging" {
    roots = true
    spans = false
    processes = false

    span_attributes = ["http.method", "http.target", "http.status_code"]

    output {
        logs = [otelcol.exporter.loki.autologging.input]
    }
}

otelcol.exporter.loki "autologging" {
    forward_to = [loki.process.autologging.receiver]
}

loki.process "autologging" {
    stage.json {
       expressions = {"body" = ""}
    }

    stage.output {
       source = "body"
    }

    stage.logfmt {
        mapping = {
            http_method_extracted      = "http.method",
            http_status_code_extracted = "http.target",
            http_target_extracted      = "http.status_code",

        }
    }

    stage.labels {
        values = {
            method = "http_method_extracted",
            status = "http_status_code_extracted",
            target = "http_target_extracted",
        }
    }

    forward_to = [loki.write.mythical.receiver]
}
```

</details>

#### Verification

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Section 7 Verification` and you should see a dashboard with panels containing the rate of spanlog ingestion as well as the spanlogs themselves.

<img width="910" alt="image" src="https://github.com/user-attachments/assets/07cea252-4ba4-489b-957f-eaaeccb07418" />

<img width="911" alt="image" src="https://github.com/user-attachments/assets/fa6b332e-9f32-4844-8213-263f68427ba3" />

# Hands-on Exercises
### Mission 1: The Hidden Key

#### Description

One of our trusted informants has stashed an encrypted file—`secret_message.txt.enc`—on a remote dead-drop.
This file can be found within the series repo. 

The decryption key? Hidden in plain sight, embedded in an internal label on the service discovery targets.
Since internal labels are stripped before metrics make it to Mimir, this covert tactic kept the key out of enemy hands.

Your mission: use Alloy to uncover the hidden key, decrypt the message, and reveal the intel within.

#### Objectives

- Use the Alloy UI to find the key hidden in the internal label on the service discovery targets
- Decode the key and decrypt the secret message

#### Instructions

Access the [Alloy UI](http://localhost:12347) and look for the hidden key on one of the service discovery targets.

To decrypt and print the AES-256-CBC encrypted secret message, run the following command in the terminal at the root of the project directory, using the key you just found:
`openssl enc -aes-256-cbc -d -salt -pbkdf2 -in secret_message.txt.enc -k '<key>'`

#### Verification

You should see the secret message in the console!

### Mission 2: The Cardinality Crisis

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

Go back to the portion of config from **Section 4**, where we started scraping metrics from the mythical services. Paste the following above the `prometheus.write.queue` component (**note**: the order of components does not matter, this is just for organization and readability):

```alloy
prometheus.relabel "mission_2" {
    forward_to = [prometheus.write.queue.experimental.receiver]

  //define a relabel rule to extract the cloud provider from the instance_id label and add it as a new label called cloud_provider
    rule {
        action        = "// TODO: Fill this in"
        target_label  = "// TODO: Fill this in"
        source_labels = ["// TODO: Fill this in"]
        regex         = "^(aws|gcp|azure)-.+"
        replacement   = "$1"
    }

    // drop the instance_id label from metrics
    rule {
        action  = "// TODO: Fill this in"
        regex   = "// TODO: Fill this in"
    }
}
```

#### Verification

Navigate to the [Explore](http://localhost:3000/explore) page and look at the metrics.
Query for `count by (cloud_provider) (rate(mythical_db_request_count_total [$__rate_interval]))` and you should see a non-zero value.

<img width="909" alt="image" src="https://github.com/user-attachments/assets/7a2fc73e-03ea-4e5c-be12-e4053027172c" />

### Mission 3: Attribute Alignment

After much debate, the various departments within IMF have reached a rare consensus: it's time to standardize the attribute name for service tiers.

Until now, teams have been using conflicting keys like `servicetier` and `tier`, creating chaos in spanmetrics and cross-department dashboards.

Headquarters has spoken: `service.tier` is the new standard.

Your mission: use Alloy to bring order to the data.
Standardize the attribute across the board so that spanmetrics flow smoothly and dashboards speak a common language.

#### Objectives

- Use the [`otelcol.processor.attributes`](https://grafana.com/docs/agent/latest/flow/reference/components/otelcol.processor.attributes/) component to set the `service.tier` attribute to the value of the `servicetier` or `tier` attributes.
- Drop the `servicetier` and `tier` attributes.

#### Instructions

The [`otelcol.processor.attributes`](https://grafana.com/docs/alloy/latest/reference/components/otelcol/otelcol.processor.attributes/) component allows you to add, set, or drop attributes.

Go back to the portion of config from **Section 5**, where we received traces from the mythical services. Paste the following  above the `otelcol.processor.batch.default` component (**note**: the order of components does not matter, this is just for organization and readability):

```alloy
otelcol.processor.attributes "mission_3" {
    // These two actions are used to add the service.tier attribute to spans from
    // either the servicetier or tier attributes.
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

Navigate to [Dashboards](http://localhost:3000/dashboards) > `Mission 3` and you should see a dashboard with data including the new `service_tier` label, which came from spanmetrics generation using the `service.tier` attribute we just consolidated.

<img width="909" alt="image" src="https://github.com/user-attachments/assets/db5b980b-83b1-4c92-9d19-b33e50a52530" />


### Mission 4: Redact and Protect

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
