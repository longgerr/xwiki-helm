# Change Log

This file documents all notable changes to xwiki Helm Chart. The release numbering uses semantic versioning.

## v1.0.4

* Support value `tomcat.customServerConfig` to replace default tomcat `server.xml`. Put the customized `server.xml` in `files` folder.

## v1.0.3

* Support value `hostAliases` to resolve extension DNS issue.

## v1.0.2

* Change deployment label `app` to use full name instead of image name.
* Add label `app`, `version` to `Service` and `Ingress`.
* Change appVersion to 11.10.5

## v1.0.1

* Support `nodeStickyMode` to run xwiki in node sticky mode. Sample value see `values.yaml`

## v1.0.0

Initial version