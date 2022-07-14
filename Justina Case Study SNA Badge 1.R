library(tidyverse) 
library(tidygraph)
library(ggraph)
library(readxl)

dlt2_nodes <- read_csv("dlt2-nodes.csv")
dlt2_edges <- read_csv("dlt2-edges.csv")

teacher_network <- tbl_graph(edges = dlt2_edges,
                             nodes = dlt2_nodes, 
                             directed = TRUE)
plot(teacher_network)

ggraph(teacher_network, layout = "fr") + 
  geom_edge_link(arrow = arrow(length = unit(.1, 'mm')), 
                 end_cap = circle(.5, 'mm'), 
                 start_cap = circle(.5, 'mm'), 
                 alpha = .05) + 
  geom_node_point (aes(size = local_size(),
                       color = grades)) + 
  geom_node_text(aes(label = uid, size = local_size()), 
                 repel = TRUE)

                                                              