# Change Log

This file documents all notable changes to xwiki Helm Chart. The release numbering uses semantic versioning.

## v1.0.10

* Add `readinessProbe` and `livenessProbe`. Use exec command instead of httpGet because xwiki returns 302 and 401 when get /

## v1.0.9

* Support value `glowroot.properties` to generate glowroot properties file.

## v1.0.8

* Support value `glowroot.enabled` and `glowroot.ingress` to expose glowroot to ingress

## v1.0.7

* Support value `env` to add additional environment variables to pod.

## v1.0.6

* Support `ingress.tls` to generate tls settings for ingress.

## v1.0.5

* Support value `customConfigAfterFirstStart` to generate `initContainers` to patch config files after the first xwiki initialization start.

## v1.0.4

* Support value `tomcat.customServerConfig` to replace default tomcat `server.xml`.  
  Maintain the customized template in `files/server.xml`.
* Set `tomcat.customServerConfig.enableRemoteIPValue: true` to use value `org.apache.catalina.valves.RemoteIpValve`. 

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