---
layout: post
title: "Federated DAG of events"
permalink: federated-dag-of-events.html
---

Following is the list of invariants that needs to be met when
building a federated and distributed eventing system.

* One or more machines can participate in the network.
* Each machine shall store the full set of events generated in the network
  from `beginning` to `end`, where beginning is the time when the first
  machine got activated in the network.
* More machines can join the network at any point in time as long as
  it happens after `beginning`.
* There are no upper limits on the number of machines that can join
  the network, it practice it shall scale up as high as one million
  machines.
* Events are stored as Directed Acyclic Graph (DAG), and each machine is
  a state machine holding on to this DAG.
* Each machine can independently create new events. Every event shall be
  self contained and describe itself in JSON like:
  ```json
  {"uuid": "<universally unique id>",
   "parents": ["<parent1-uuid>", "<parent2-uuid>", "<parent3-uuid>" ],
  }
  ```
  Along with `uuid` and `parent` property an event can be described with
  any number of additional properties.
* Every machine in the network shall asynchronously replicate events,
  that are generated locally, to remaining machine.
* Each machine will start with the same root event `R`.
* When a machine generate new event its parent is the latest
  event in the DAG that it holds. Example: `R -> Ax`, where Ax is event
  `A` generated in machine `X` whose parent is root event `R`.
* With only one machine in the network, its DAG will look like:

      R -> Ax -> Bx -> Cx -> Dx

  Where events A, B, C, D are generated, in the same time order, on the
  only machine X in the network.

* When the current DAG of events, in a given machine X, have multiple leaf
  events, then the newly generated event will consider all leaf events
  at the tip of the DAG as its parents. In short, an event can have
  multiple parents. Example:

      R -> Ax -> Bx -> Dx
           |           ^
           |           |
           *---> Cy ---*

  Newly generated event `D` in machine `X` will consider both leaf events
  `Bx` and `Cy` as its parent. Note that `Cy` was the event `C` generate
  in machine `Y` and got replicated to this machine.
* Nodes can in this manner independently generate events and replicate
  them asynchronously across remaining machines in the network.
* At any point, if we stop the world and finish replicating remaining
  events from every machine, each machine shall end up with a DAG graph G'
  that is exactly identical across every participating machine in the network.

Above is a strict set of invariants that can be relaxed or modified with
adequate reasoning and proper explanation about trade-offs.

Question is, what is the flow chart for this state machine ?

Version no : 6
