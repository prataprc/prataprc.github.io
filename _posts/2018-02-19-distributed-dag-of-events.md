---
layout: post
title: "Distributed DAG of events"
permalink: distributed-dag-of-events.html
---

Following is the list of invariants that needs to be met when
building a distributed eventing system.

* One or more nodes can participate in the network.
* Each node shall store the full set of events generated in the network
  from `beginning` to `end`, where beginning is the time when the first
  node got activated in the network.
* More nodes can join the network at any point in time as long as
  it happens after `beginning`.
* There are no upper limits on the number of nodes that can join
  the network, it practice it shall scale up as high as one million
  nodes.
* Events are stored as Directed Acyclic Graph (DAG), and each node is
  a state machine holding on to this DAG.
* Each node can independently create new events.
* Every node in the network shall asynchronously replicate
  events, that are generated locally, to remaining nodes.
* Each node will start with the same root event `R`.
* When a node generate new event its parent is the latest
  event in the DAG. Example: R -> Ax, where Ax is event `A` generated
  in node `X` whose parent is root event `R`.
* When the current DAG of events, in a given node X, have multiple leaf
  events, then the newly generated event will consider all leaf events
  at the tip of the DAG as its parents. In short, an event can have
  multiple parents. Example:

      R -> Ax -> Bx -> Dx
           |           ^
           |           |
           *---> Cy ---*

  Newly generated event `D` in node `X` will consider both leaf events
  `Bx` and `Cy` as its parent.
* Nodes can in this manner independently generate events and replicate
  them asynchronously across remaining nodes in the network.
* At any point, if we stop the world and finish replicating remaining
  events from every node, each node shall end up with a DAG graph G'
  that is exactly identical across every participating node in the network.

Above is a strict set of invariants that can be relaxed or modified with
adequate reasoning and proper explanation about trade-offs.

Question is, what is the flow chart for this state machine ?

Version no : 3
