# sparqlmap-docker
A Docker wrapper around SparqlMap


# Configuration

## Set the action

```
-e ACTION=web
```

## Set the data source

```
-e DS_URL=jdbc:mysql...... -e DS_USERNAME=admin -e DS_PASSWORD=test
```






## Supplying a R2RML mapping
If no mapping is provided, SparqlMap will use the default mapping.  To use your own mapping, you have to first mount the mapping into the container:

```
-v <path/to/mapping/>.ttl:/etc/sparqlmap/mapping.ttl 
```
and additionally tell the SparqlMap to use this mapping

```
-e R2RML_FILE=/etc/sparqlmap/mapping.ttl
```