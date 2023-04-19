---
title: Pulsar Meetup 2021.12
author: Zhenhao Li
mode : selfcontained
knit : slidify::knit2slides
highlighter : highlight.js #highlight.js   #highlight  #prettify
framework: revealjs
hitheme : vs2015  #solarized-light #rainbow #atom-one-dark #foundation #vs2015 #sunburst #zenburn #tomorrow
widgets : [mathjax] 
revealjs:
  theme: sky
  transition: linear #linear #concave
  center: "true"
url: {lib: "."}
bootstrap:
  theme: amelia
---
<style>
    .reveal h5 {
                  text-transform: none;
          }
</style>


## Pulsar for startup

#### Pulsar Meetup 2021.12 

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

*** For text alignment check the following
*** https://github.com/hakimel/reveal.js/issues/1897
*** https://stackoverflow.com/questions/21019476/how-can-i-get-left-justified-paragraphs-in-reveal-js?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

This is the title page.


--- &vertical

### About me

> - Data science & engineering since 2015
> - Independent consultant since 2019
> - <div>
  Building https://pairtime.com
  <figure><img class='plain' src='figure/PairTime_Logo_Blue.png'/></figure>
</div>

<script>$('ul.incremental li').addClass('fragment')</script>

--- &vertical

### About PairTime Tech

> - Event sourced backend (Scala)
> - Server-side rendered frontend (Scala)
> - Deep learning models for recommendations (Python and Rust)


<script>$('ul.incremental li').addClass('fragment')</script>

--- &vertical

### Event sourcing is about...

> - keeping full history of your domain events
> - software states being derived from the events
 (let's call anything that has a state an entity)

<script>$('ul.incremental li').addClass('fragment')</script>

***

#### Benefit of event sourcing

> - You don't lose data
> - Time travel
> - Events are your data model


***

#### Requirements for storing events 

> - Low latency and high throughput for writing
> - Low latency and high throughput for state derivation
> - No limit on the volume of data
> - Support full history replay

<script>$('ul.incremental li').addClass('fragment')</script>


--- &vertical

### Problems we had

> - We use Akka's Cassandra event store, which doesn't have unlimited scalability on data volume
> - We want to build/update the query side (as in CQRS) views in real time

<script>$('ul.incremental li').addClass('fragment')</script>

***


### Why not kafka 

> - Each Kafka partition is bounded by a signle disk and can not be split
> - The Avro serializer (to use the schema registry) uses a binary format that is incompatible with Apache Avro.

---

# Thank you! 

